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
    extern MemRefDescriptor1D<float> dynamic_padding_and_mul_filter_auto_reuse(
        float* input_allocated,      // input allocated pointer
        float* input_aligned,        // input aligned pointer
        int64_t input_offset,        // input offset
        int64_t input_size,          // input size
        int64_t input_stride,        // input stride
        float* filter_allocated,     // filter allocated pointer
        float* filter_aligned,       // filter aligned pointer
        int64_t filter_offset,       // filter offset
        int64_t filter_size,         // filter size
        int64_t filter_stride,       // filter stride
        int64_t padding              // padding length
    );
}