#include <stdio.h>
#include <cstdlib>
#include "tensor_padding.h"
#include <valgrind/callgrind.h>

int main() {
    
    int64_t input_size = 10000;
    float* input_data = (float*)malloc(input_size * sizeof(float));
    for (int i=0; i<input_size; ++i) input_data[i] = i;
    
    int64_t padding = 5000;
    int64_t filter_size = input_size + padding;  // Filter size matches padded output
    float* filter_data = (float*)malloc(filter_size * sizeof(float));
    for (int i=0; i<filter_size; ++i) filter_data[i] = 2.0f;

    CALLGRIND_START_INSTRUMENTATION;
    MemRefDescriptor1D<float> result = dynamic_padding_and_mul_filter_auto_reuse(
        input_data,    // input allocated pointer
        input_data,    // input aligned pointer
        0,             // input offset
        input_size,    // input size
        1,             // input stride
        filter_data,   // filter allocated pointer
        filter_data,   // filter aligned pointer
        0,             // filter offset
        filter_size,   // filter size
        1,             // filter stride
        padding        // padding length
    );
    CALLGRIND_STOP_INSTRUMENTATION;
    
    free(input_data);
    free(filter_data);
    free(result.allocated);
    
    return 0;
}