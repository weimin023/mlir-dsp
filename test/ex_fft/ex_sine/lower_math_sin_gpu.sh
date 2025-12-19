#!/bin/bash
set -ex
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../llvm-project/build/bin

echo "=== Step 1: Convert to GPU kernel ==="
# First, we need to wrap the function in a GPU kernel
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/test_math_sin_gpu.mlir \
    --convert-func-to-llvm \
    -o $SCRIPT_DIR/sin_step1.mlir

echo ""
echo "=== Step 2: Lower math to LLVM (creates llvm.intr.sin) ==="
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/test_math_sin_gpu.mlir \
    --convert-math-to-llvm \
    -o $SCRIPT_DIR/sin_step2_llvm.mlir

echo ""
echo "=== Alternative: Expand math ops to polynomial approximation ==="
$LLVM_BIN_DIR/mlir-opt $SCRIPT_DIR/test_math_sin_gpu.mlir \
    --test-math-polynomial-approximation \
    -o $SCRIPT_DIR/sin_step2_poly.mlir

echo ""
echo "=== For GPU: Need to use NVVM intrinsics directly ==="
echo "NVVM provides: nvvm.sin.approx.f32 for fast approximation"
echo "See the manual example in sin_nvvm_manual.mlir"

cat > $SCRIPT_DIR/sin_nvvm_manual.mlir << 'EOF'
// Manual example showing NVVM intrinsic usage
module {
  gpu.module @sin_kernel {
    llvm.func @llvm.nvvm.sin.approx.f32(f32) -> f32
    
    llvm.func @sin_gpu(%arg0: f32) -> f32 attributes {gpu.kernel, nvvm.kernel} {
      %result = llvm.call @llvm.nvvm.sin.approx.f32(%arg0) : (f32) -> f32
      llvm.return %result : f32
    }
  }
}
EOF

echo ""
echo "Generated files:"
echo "  - sin_step2_llvm.mlir: math.sin -> llvm.intr.sin (host-only)"
echo "  - sin_step2_poly.mlir: math.sin -> polynomial approximation"
echo "  - sin_nvvm_manual.mlir: Direct NVVM intrinsic (GPU-compatible)"
