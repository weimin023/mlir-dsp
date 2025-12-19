#!/bin/bash
set -ex
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../../llvm-project/build/bin

# 1. TOSA to Linalg
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/tosa_fft.mlir \
    --pass-pipeline="builtin.module(func.func(tosa-to-linalg))" \
    -o $SCRIPT_DIR/tosa_to_linalg.mlir

# 2. Bufferize (One-Shot)
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/tosa_to_linalg.mlir \
    -one-shot-bufferize="bufferize-function-boundaries=true" \
    -buffer-deallocation-pipeline \
    -o $SCRIPT_DIR/bufferized.mlir

# 3. Linalg to Loops
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/bufferized.mlir \
    -convert-linalg-to-loops \
    -o $SCRIPT_DIR/loops.mlir

# 4. Lower to LLVM
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/loops.mlir \
    -convert-scf-to-cf \
    -lower-affine \
    -convert-bufferization-to-memref \
    -expand-strided-metadata \
    -llvm-request-c-wrappers \
    -convert-func-to-llvm \
    -convert-cf-to-llvm \
    -finalize-memref-to-llvm \
    -convert-arith-to-llvm \
    -convert-math-to-llvm \
    -convert-complex-to-llvm \
    -convert-index-to-llvm \
    -reconcile-unrealized-casts \
    -canonicalize \
    -o $SCRIPT_DIR/llvm.mlir

# 5. Translate to LLVM IR
$LLVM_BIN_DIR/mlir-translate \
    $SCRIPT_DIR/llvm.mlir \
    --mlir-to-llvmir \
    -o $SCRIPT_DIR/fft.ll

# 6. Compile to Object File
$LLVM_BIN_DIR/llc \
    $SCRIPT_DIR/fft.ll \
    -filetype=obj \
    -relocation-model=pic \
    -o $SCRIPT_DIR/fft.o

echo "Lowering completed successfully!"
