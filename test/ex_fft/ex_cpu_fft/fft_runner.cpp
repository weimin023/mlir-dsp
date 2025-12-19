#include <iostream>
#include <vector>
#include <complex>
#include <cstring>

// Define MemRef descriptor structure compatible with MLIR
template<typename T, int Rank>
struct MemRefDescriptor {
    T* allocated;
    T* aligned;
    int64_t offset;
    int64_t sizes[Rank];
    int64_t strides[Rank];
};

struct ReturnStruct {
    MemRefDescriptor<float, 3> res_real;
    MemRefDescriptor<float, 3> res_imag;
};

// External function declaration (the lowered MLIR function)
extern "C" void _mlir_ciface_tosa_fft(ReturnStruct* res, MemRefDescriptor<float, 3>* arg0_real, MemRefDescriptor<float, 3>* arg0_imag);

int main() {
    const int N = 8;
    // Input data: (1, 1, 8)
    std::vector<float> real_data(N);
    std::vector<float> imag_data(N, 0.0f);
    
    for (int i = 0; i < N; ++i) {
        real_data[i] = (float)i;
    }

    // Create descriptors
    MemRefDescriptor<float, 3> input_real = {
        real_data.data(), real_data.data(), 0, {1, 1, N}, {N, N, 1}
    };
    MemRefDescriptor<float, 3> input_imag = {
        imag_data.data(), imag_data.data(), 0, {1, 1, N}, {N, N, 1}
    };

    ReturnStruct res;

    std::cout << "Calling TOSA FFT..." << std::endl;
    _mlir_ciface_tosa_fft(&res, &input_real, &input_imag);
    std::cout << "Returned from TOSA FFT." << std::endl;

    std::cout << "Result:" << std::endl;
    float* res_real_ptr = res.res_real.aligned;
    float* res_imag_ptr = res.res_imag.aligned;
    
    for (int i = 0; i < N; ++i) {
        std::cout << res_real_ptr[i] << "+" << res_imag_ptr[i] << "j, ";
    }
    std::cout << std::endl;

    return 0;
}
