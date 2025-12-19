#!/bin/bash
set -ex

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../../llvm-project/build/bin
LLVM_LIB_DIR=$SCRIPT_DIR/../../../../llvm-project/build/lib

# 1. Compile the C++ runner
g++ -O3 \
    $SCRIPT_DIR/fft_runner.cpp \
    $SCRIPT_DIR/fft.o \
    -o $SCRIPT_DIR/fft_runner \
    -L$LLVM_LIB_DIR \
    -lmlir_runner_utils \
    -lmlir_c_runner_utils \
    -Wl,-rpath,$LLVM_LIB_DIR

echo ""
echo "✅ Build successful!"
echo "   Executable: $SCRIPT_DIR/fft_runner"
echo ""
echo "Run with: ./fft_runner"
