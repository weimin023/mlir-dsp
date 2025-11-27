#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Building ex_padding1d..."

# Run the lowering script
bash $SCRIPT_DIR/lower_tensor.sh

# Compile and link
echo "Compiling and linking..."
g++ $SCRIPT_DIR/ex2_main.cpp $SCRIPT_DIR/mlir_runtime.cpp $SCRIPT_DIR/toLLVM.o -o $SCRIPT_DIR/ex_padding1d_run

echo "Build successful! Run with: $SCRIPT_DIR/ex_padding1d_run"
