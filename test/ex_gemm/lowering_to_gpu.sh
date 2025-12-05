set -ex

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../llvm-project/build/bin

# 1. Tile the loops
# 2. Map to GPU
# 3. Outline kernel
# 4. Lower to NVVM

# Step 1: Tile loops
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/toMemref.mlir \
    -affine-loop-tile="tile-size=16" \
    -o $SCRIPT_DIR/1_tiled.mlir

# Step 2: Map to GPU blocks/threads
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/1_tiled.mlir \
    -pass-pipeline="builtin.module(func.func(convert-affine-for-to-gpu{gpu-block-dims=1 gpu-thread-dims=1}))" \
    -o $SCRIPT_DIR/2_gpu_mapped.mlir

# Step 3: Outline the kernel
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/2_gpu_mapped.mlir \
    -gpu-kernel-outlining \
    -o $SCRIPT_DIR/3_outlined.mlir

# Step 4: Lower to NVVM
$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/3_outlined.mlir \
    -pass-pipeline="builtin.module(func.func(lower-affine, convert-scf-to-cf), gpu.module(lower-affine, convert-scf-to-cf, convert-gpu-to-nvvm), reconcile-unrealized-casts)" \
    -o $SCRIPT_DIR/4_nvvm.mlir
