// MemRef descriptor structure for 1D tensors
// Matches MLIR's memref ABI: {allocated_ptr, aligned_ptr, offset, size, stride}
template<typename T>
struct MemRefDescriptor1D {
    T* allocated;
    T* aligned;
    int64_t offset;
    int64_t size;
    int64_t stride;
};

extern "C" {
    extern int add(int a,int b);

    extern int sub(int a,int b);

    extern int mul(int a,int b);

    extern int my_div(int a,int b);

    // padding1d function from tensor.mlir
    // Takes input memref and target length, returns padded memref
    extern MemRefDescriptor1D<float> padding1d(
        float* allocated,      // input allocated pointer
        float* aligned,        // input aligned pointer
        int64_t offset,        // input offset
        int64_t size,          // input size
        int64_t stride,        // input stride
        int32_t target_len     // target length to pad to
    );
}