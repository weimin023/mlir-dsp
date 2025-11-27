set -ex

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../llvm-project/build/bin

$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/tensor_padding.mlir \
    -canonicalize \
    -o $SCRIPT_DIR/toBeforeBufferizeMemref.mlir

$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/toBeforeBufferizeMemref.mlir \
    -one-shot-bufferize="bufferize-function-boundaries=true" \
    -canonicalize \
    -o $SCRIPT_DIR/toMemref.mlir

$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/toMemref.mlir \
    -convert-linalg-to-loops \
    -o $SCRIPT_DIR/toLoops.mlir

$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/toLoops.mlir \
    -convert-scf-to-cf \
    -o $SCRIPT_DIR/toCF.mlir

$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/toCF.mlir \
    -lower-affine \
    -expand-strided-metadata \
    -convert-func-to-llvm \
    -convert-cf-to-llvm \
    -finalize-memref-to-llvm \
    -convert-arith-to-llvm \
    -reconcile-unrealized-casts \
    -canonicalize \
    -o $SCRIPT_DIR/toLLVM.mlir

$LLVM_BIN_DIR/mlir-translate \
    $SCRIPT_DIR/toLLVM.mlir \
    --mlir-to-llvmir \
    -o $SCRIPT_DIR/toLLVM.ll

$LLVM_BIN_DIR/llc \
    $SCRIPT_DIR/toLLVM.ll \
    -filetype=obj \
    -relocation-model=pic \
    -o $SCRIPT_DIR/toLLVM.o
