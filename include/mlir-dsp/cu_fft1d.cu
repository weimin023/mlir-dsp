#include <cuComplex.h>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cuda_runtime.h>

#define CHECK_CUDA(stat) \
    CHECK((stat) != cudaSuccess, "CUDA error %s", cudaGetErrorString(stat))

// This function is identical to reverse_bits, but it is specialized to run on
// the GPU. For compatibility reasons, I did not declare this a __device__
// __host__ function.
__device__ uint32_t reverse_bits_gpu(uint32_t x)
{
    x = ((x & 0xaaaaaaaa) >> 1) | ((x & 0x55555555) << 1);
    x = ((x & 0xcccccccc) >> 2) | ((x & 0x33333333) << 2);
    x = ((x & 0xf0f0f0f0) >> 4) | ((x & 0x0f0f0f0f) << 4);
    x = ((x & 0xff00ff00) >> 8) | ((x & 0x00ff00ff) << 8);
    return (x >> 16) | (x << 16);
}

// This is used by `fft_gpu`.
// This FFT algorithm works just like the Cooley-Tukey algorithm,
// except a single thread is in charge of each of the N elements.
// Threads synchronize in order to traverse the array log N times.
__global__ void fft_kernel(const cuFloatComplex* x, cuFloatComplex* Y, uint32_t N, int logN)
{
    // Find this thread's index in the input array.
    uint32_t i = threadIdx.x + blockIdx.x * blockDim.x;

    // Start by bit-reversing the input.
    // Reverse the 32-bit index.
    // Only keep the last logN bits of the output.
    uint32_t rev;

    rev = reverse_bits_gpu(2 * i);
    rev = rev >> (32 - logN);
    Y[2 * i] = x[rev];

    rev = reverse_bits_gpu(2 * i + 1);
    rev = rev >> (32 - logN);
    Y[2 * i + 1] = x[rev];

    __syncthreads();

    // Set mh to 1, 2, 4, 8, ..., N/2
    for (int s = 1; s <= logN; s++) {
        int mh = 1 << (s - 1);  // 2 ** (s - 1)

        // k = 2**s * (2*i // 2**(s-1))  for i=0..N/2-1
        // j = i % (2**(s - 1))  for i=0..N/2-1
        int k = threadIdx.x / mh * (1 << s);
        int j = threadIdx.x % mh;
        int kj = k + j;

        cuFloatComplex a = Y[kj];

        // exp(-2i pi j / 2**s)
        // exp(-2i pi j / m)
        // exp(-i pi j / (m/2))
        // exp(ix)
        // cos(x) + i sin(x)
        float tr;
        float ti;

        // TODO possible optimization:
        // pre-compute twiddle factor array
        // twiddle[s][j] = exp(-i pi * j / 2**(s-1))
        // for j=0..N/2-1 (proportional)
        // for s=1..log N
        // need N log N / 2 tmp storage...

        // Compute the sine and cosine to find this thread's twiddle factor.
        sincosf(-(float)M_PI * j / mh, &ti, &tr);
        cuFloatComplex twiddle = make_cuFloatComplex(tr, ti);

        cuFloatComplex b = cuCmulf(twiddle, Y[kj + mh]);

        // Set both halves of the Y array at the same time
        Y[kj] = cuCaddf(a, b);
        Y[kj + mh] = cuCsubf(a, b);

        // Wait for all threads to finish before traversing the array once more.
        __syncthreads();
    }
}

// fft_gpu
//
// This function computes the discrete Fourier transform (DFT) of a vector of
// complex floats using a parallelized iterative version of the Cooley-Tukey fast 
// Fourier transform algorithm (FFT). Computing the output requires 
// O(N log_2 N) operations for input of length N.
//
// Parameters:
// x: CUDA complex float array that serves as the input
// Y: CUDA complex float array in which to store the DFT of x
// N: length of the input and output arrays
//
// N must be a power of 2
//
// Return value:
// This function returns 0 if it succeeded, -1 otherwise.
int fft_gpu(const cuFloatComplex* x, cuFloatComplex* Y, uint32_t N)
{
    // if N>0 is a power of 2 then
    // N & (N - 1) = ...01000... & ...00111... = 0
    // otherwise N & (N - 1) will have a 0 in it
    if (N & (N - 1)) {
        fprintf(stderr, "N=%u must be a power of 2.  "
                "This implementation of the Cooley-Tukey FFT algorithm "
                "does not support input that is not a power of 2.\n", N);

        return -1;
    }

    int logN = (int) log2f((float) N);

    cudaError_t st;

    // Allocate memory on the CUDA device.
    cuFloatComplex* x_dev;
    cuFloatComplex* Y_dev;
    st = cudaMalloc((void**)&Y_dev, sizeof(*Y) * N);
    // Check for any CUDA errors
    CHECK_CUDA(st);

    st = cudaMalloc((void**)&x_dev, sizeof(*x) * N);
    CHECK_CUDA(st);

    // Copy input array to the device.
    st = cudaMemcpy(x_dev, x, sizeof(*x) * N, cudaMemcpyHostToDevice);
    CHECK_CUDA(st);

    // Send as many threads as possible per block.
    int cuda_device_ix = 0;
    cudaDeviceProp prop;
    st = cudaGetDeviceProperties(&prop, cuda_device_ix);
    CHECK_CUDA(st);

    // Create one thread for every two elements in the array 
    int size = N >> 1;
    int block_size = min(size, prop.maxThreadsPerBlock);
    dim3 block(block_size, 1);
    dim3 grid((size + block_size - 1) / block_size, 1);

    // Call the kernel
    fft_kernel <<< grid, block >>> (x_dev, Y_dev, N, logN);

    // Copy the output
    st = cudaMemcpy(Y, Y_dev, sizeof(*x) * N, cudaMemcpyDeviceToHost);
    CHECK_CUDA(st);

    // Free CUDA memory
    st = cudaFree(x_dev);
    CHECK_CUDA(st);
    st = cudaFree(Y_dev);
    CHECK_CUDA(st);

    return EXIT_SUCCESS;
}