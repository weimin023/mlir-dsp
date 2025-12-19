// Wrapper to call MLIR-generated tosa_fft with proper memref descriptors

#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>

// Memref descriptor structure (matches MLIR's lowered representation)
template<typename T, int Rank>
struct MemRefDescriptor {
    T* allocated;
    T* aligned;
    int64_t offset;
    int64_t sizes[Rank];
    int64_t strides[Rank];
};

// The MLIR-generated function signature (returns two memrefs)
struct ReturnType {
    MemRefDescriptor<float, 3> real;
    MemRefDescriptor<float, 3> imag;
};

extern "C" {
    void _mlir_ciface_tosa_fft(
        ReturnType* result,
        MemRefDescriptor<float, 3>* arg0,
        MemRefDescriptor<float, 3>* arg1
    );
}

int main() {
    printf("=== TOSA FFT GPU Execution (MLIR Runtime) ===\n\n");
    
    // Initialize CUDA
    cuInit(0);
    
    // Prepare input data (1x1x8 real and imaginary parts)
    const int N = 8;
    float h_real[N] = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f};
    float h_imag[N] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
    
    printf("Input (real): ");
    for (int i = 0; i < N; i++) printf("%.1f ", h_real[i]);
    printf("\n\n");
    
    // Call the MLIR-generated function with proper memref descriptors
    printf("Calling MLIR-generated tosa_fft function...\n");
    
    MemRefDescriptor<float, 3> input_real = {h_real, h_real, 0, {1, 1, 8}, {8, 8, 1}};
    MemRefDescriptor<float, 3> input_imag = {h_imag, h_imag, 0, {1, 1, 8}, {8, 8, 1}};
    ReturnType result;

    _mlir_ciface_tosa_fft(&result, &input_real, &input_imag);
    
    printf("Kernel completed!\n\n");
    
    // Print results
    printf("Output (real): ");
    for (int i = 0; i < N; i++) {
        printf("%.2f ", result.real.aligned[i]);
    }
    printf("\n");
    
    printf("Output (imag): ");
    for (int i = 0; i < N; i++) {
        printf("%.2f ", result.imag.aligned[i]);
    }
    printf("\n");
    
    // Free the allocated memory
    free(result.real.allocated);
    free(result.imag.allocated);
    
    printf("\n✅ Success!\n");
    return 0;
}
