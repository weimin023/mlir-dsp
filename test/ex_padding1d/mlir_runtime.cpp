#include <cstring>
#include <cstdint>

// Runtime function for memref copy operations
// This is called by MLIR-generated code to copy data between memrefs
extern "C" void memrefCopy(int64_t elem_size, void* src_desc, void* dst_desc) {
    // Extract the memref descriptor fields
    // Format: {rank, descriptor_ptr}
    struct UnrankedMemRefType {
        int64_t rank;
        void* descriptor;
    };
    
    // For ranked 1D memref: {allocated_ptr, aligned_ptr, offset, size, stride}
    struct MemRef1D {
        void* allocated;
        void* aligned;
        int64_t offset;
        int64_t size;
        int64_t stride;
    };
    
    UnrankedMemRefType* src = (UnrankedMemRefType*)src_desc;
    UnrankedMemRefType* dst = (UnrankedMemRefType*)dst_desc;
    
    MemRef1D* src_memref = (MemRef1D*)(src->descriptor);
    MemRef1D* dst_memref = (MemRef1D*)(dst->descriptor);
    
    // Calculate the number of bytes to copy
    int64_t num_bytes = src_memref->size * elem_size;
    
    // Perform the copy
    memcpy(dst_memref->aligned, src_memref->aligned, num_bytes);
}
