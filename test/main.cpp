#include <iostream>
#include <cstdlib>
#include "mlir.h"

int main() {
    int a = 2;
    int b = 4;
    std::cout << "add: " << add(b,a) << std::endl;
    std::cout << "sub: " << sub(b,a) << std::endl;
    std::cout << "mul: " << mul(b,a) << std::endl;
    std::cout << "div: " << my_div(b,a) << std::endl;
    
    std::cout << "\n--- Testing padding1d ---" << std::endl;
    
    // Create input array: [1.0, 2.0, 3.0]
    int64_t input_size = 3;
    float* input_data = (float*)malloc(input_size * sizeof(float));
    input_data[0] = 1.0f;
    input_data[1] = 2.0f;
    input_data[2] = 3.0f;
    
    std::cout << "Input array (size=" << input_size << "): ";
    for (int i = 0; i < input_size; i++) {
        std::cout << input_data[i] << " ";
    }
    std::cout << std::endl;
    
    // Call padding1d to pad to length 7
    int32_t target_len = 7;
    MemRefDescriptor1D<float> result = padding1d(
        input_data,    // allocated pointer
        input_data,    // aligned pointer (same as allocated for simple case)
        0,             // offset
        input_size,    // size
        1,             // stride
        target_len     // target length
    );
    
    std::cout << "Padded array (size=" << result.size << "): ";
    for (int64_t i = 0; i < result.size; i++) {
        std::cout << result.aligned[i] << " ";
    }
    std::cout << std::endl;
    
    // Clean up
    free(input_data);
    free(result.allocated);
    
    return 0;
}