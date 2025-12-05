set -ex

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../llvm-project/build/bin

$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/naive_gemm.mlir \
    -one-shot-bufferize="bufferize-function-boundaries=true" \
    -o $SCRIPT_DIR/toMemref.mlir

