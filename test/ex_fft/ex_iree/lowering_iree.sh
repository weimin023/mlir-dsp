#!/bin/bash
set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# We use iree-compile because manually constructing the pipeline with iree-opt 
# requires 10+ specific passes to handle all TOSA conversions (reshapes, bufferization, etc).
IREE_COMPILE=/home/linux_wmc/.local/bin/iree-compile

# This command runs the IREE pipeline up to HAL executable generation.
# We output .mlir because final VMFB linking might require system tools (CUDA SDK) 
# This command runs the full IREE pipeline:
# TOSA -> Flow -> Stream -> HAL -> NVVM/PTX -> VMFB
$IREE_COMPILE \
    $SCRIPT_DIR/tosa_fft.mlir \
    --iree-input-type=tosa \
    --iree-cuda-target=sm_89 \
    --iree-hal-target-backends=cuda \
    -o $SCRIPT_DIR/tosa_fft_cuda.vmfb

# If you want to see the lowered HAL MLIR for inspection:
$IREE_COMPILE \
    $SCRIPT_DIR/tosa_fft.mlir \
    --iree-input-type=tosa \
    --iree-hal-target-backends=cuda \
    --compile-to=hal \
    -o $SCRIPT_DIR/tosa_fft_cuda_hal.mlir

