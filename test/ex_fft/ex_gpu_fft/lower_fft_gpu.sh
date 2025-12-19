#!/bin/bash
set -ex
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../../llvm-project/build/bin

# 1. TOSA to Linalg
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/tosa_fft.mlir \
    --pass-pipeline="builtin.module(func.func(tosa-to-linalg))" \
    -o $SCRIPT_DIR/tosa_to_linalg.mlir

# 2. Bufferize
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/tosa_to_linalg.mlir \
    -one-shot-bufferize="bufferize-function-boundaries=true" \
    -o $SCRIPT_DIR/gpu_bufferized.mlir

# 3. Linalg to Affine Loops
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/gpu_bufferized.mlir \
    --convert-linalg-to-affine-loops \
    -o $SCRIPT_DIR/gpu_affine.mlir

# 4. Tile and Map to GPU
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/gpu_affine.mlir \
    --pass-pipeline="builtin.module(func.func(affine-loop-tile{tile-size=1}, convert-affine-for-to-gpu))" \
    -o $SCRIPT_DIR/gpu_mapped.mlir

# 5. Outline GPU Kernels
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/gpu_mapped.mlir \
    --gpu-kernel-outlining \
    -o $SCRIPT_DIR/gpu_outlined.mlir

# 6. Lower Affine, SCF, and expand math ops to polynomials
# KEY: --test-math-polynomial-approximation expands math.sin/cos to pure arithmetic
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/gpu_outlined.mlir \
    -lower-affine \
    -convert-scf-to-cf \
    --test-math-polynomial-approximation \
    -o $SCRIPT_DIR/gpu_math_expanded.mlir

# 7a. Serialize GPU modules to binary (PTX embedded in MLIR)
# This must happen BEFORE gpu-to-llvm
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/gpu_math_expanded.mlir \
    -convert-complex-to-llvm \
    -convert-gpu-to-nvvm \
    -nvvm-attach-target="module=.* chip=sm_89 O=3" \
    -o $SCRIPT_DIR/gpu_with_target.mlir

# 7b. Lower host code to LLVM
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/gpu_with_target.mlir \
    -convert-arith-to-llvm \
    -convert-index-to-llvm \
    -finalize-memref-to-llvm \
    -llvm-request-c-wrappers \
    -convert-func-to-llvm \
    -reconcile-unrealized-casts \
    -o $SCRIPT_DIR/gpu_host_lowered.mlir

# 7c. Serialize GPU modules to PTX binary
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/gpu_host_lowered.mlir \
    -gpu-module-to-binary \
    -o $SCRIPT_DIR/gpu_with_binary.mlir

# 7d. Lower GPU launch operations
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/gpu_with_binary.mlir \
    -gpu-to-llvm \
    -reconcile-unrealized-casts \
    -o $SCRIPT_DIR/gpu_nvvm.mlir

# 8. Translate to LLVM IR
$LLVM_BIN_DIR/mlir-translate \
    $SCRIPT_DIR/gpu_nvvm.mlir \
    --mlir-to-llvmir \
    -o $SCRIPT_DIR/gpu.ll

# 9. Compile to PTX
$LLVM_BIN_DIR/llc \
    -march=nvptx64 \
    -mcpu=sm_89 \
    $SCRIPT_DIR/gpu.ll \
    -o $SCRIPT_DIR/gpu.ptx

echo ""
echo "✅ GPU Lowering completed successfully!"
echo "   PTX output: $SCRIPT_DIR/gpu.ptx"
echo ""
echo "Key change: Used --test-math-polynomial-approximation to expand"
echo "math.sin/cos into GPU-compatible arithmetic operations."
