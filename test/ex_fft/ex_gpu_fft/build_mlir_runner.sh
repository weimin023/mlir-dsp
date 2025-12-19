#!/bin/bash
set -ex

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LLVM_BIN_DIR=$SCRIPT_DIR/../../../../llvm-project/build/bin
LLVM_BUILD_DIR=$SCRIPT_DIR/../../../../llvm-project/build

# 1. Compile the MLIR-generated LLVM IR to object file
echo "Compiling MLIR-generated GPU code..."
$LLVM_BIN_DIR/llc \
    -filetype=obj \
    -relocation-model=pic \
    $SCRIPT_DIR/gpu.ll \
    -o $SCRIPT_DIR/gpu.o

# 2. Compile the C++ runner
echo "Compiling C++ runner..."
g++ -c \
    $SCRIPT_DIR/fft_mlir_runner_v2.cpp \
    -o $SCRIPT_DIR/fft_mlir_runner.o \
    -I$LLVM_BUILD_DIR/include \
    -I/usr/local/cuda/include \
    -std=c++17 \
    -fPIC

# 3. Link everything together with MLIR runtime libraries
echo "Linking with MLIR runtime..."
g++ \
    $SCRIPT_DIR/fft_mlir_runner.o \
    $SCRIPT_DIR/gpu.o \
    -o $SCRIPT_DIR/fft_mlir_runner \
    -L$LLVM_BUILD_DIR/lib \
    -lmlir_c_runner_utils \
    -lmlir_runner_utils \
    -lmlir_cuda_runtime \
    -lcuda \
    -Wl,-rpath,$LLVM_BUILD_DIR/lib

echo ""
echo "✅ Build successful!"
echo "   Executable: $SCRIPT_DIR/fft_mlir_runner"
echo ""
echo "Run with: ./fft_mlir_runner"
