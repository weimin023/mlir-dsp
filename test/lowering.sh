set -ex

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../llvm-project/build/bin

$LLVM_BIN_DIR/mlir-opt \
    $SCRIPT_DIR/basic.mlir \
    -convert-arith-to-llvm \
    -convert-func-to-llvm  \
    -o $SCRIPT_DIR/s1.mlir

$LLVM_BIN_DIR/mlir-translate \
    $SCRIPT_DIR/s1.mlir \
    --mlir-to-llvmir \
    -o $SCRIPT_DIR/o.ll

$LLVM_BIN_DIR/llc \
    $SCRIPT_DIR/o.ll \
    -filetype=obj \
    -relocation-model=pic \
    -o $SCRIPT_DIR/output.o