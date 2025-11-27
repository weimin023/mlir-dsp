#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Building ex_basic..."

# Run the lowering script
bash $SCRIPT_DIR/lowering_basic.sh

# Compile and link
echo "Compiling and linking..."
g++ $SCRIPT_DIR/ex1_main.cpp $SCRIPT_DIR/output.o -o $SCRIPT_DIR/ex_basic_run

echo "Build successful! Run with: $SCRIPT_DIR/ex_basic_run"
