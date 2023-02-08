#include <iostream>
#include <cuda.h>

// CUDA kernel function to add elements of two arrays
__global__ void addVectors(int *a, int *b, int *c, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) {
        // Calculate the result for each element
        c[i] = a[i] + b[i];
    }
}

int main() {
    int n = 1024;  // Number of elements in arrays
    int *a, *b, *c;  // Pointers to device memory

    // Allocate memory on the device
    cudaMalloc((void**)&a, n * sizeof(int));
    cudaMalloc((void**)&b, n * sizeof(int));
    cudaMalloc((void**)&c, n * sizeof(int));

    // Copy input data from host memory to device memory
    cudaMemcpy(a, a_host, n * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(b, b_host, n * sizeof(int), cudaMemcpyHostToDevice);

    // Invoke the CUDA kernel with the specified number of blocks and threads
    addVectors<<<n / 256, 256>>>(a, b, c, n);

    // Copy the result from device memory to host memory
    cudaMemcpy(c_host, c, n * sizeof(int), cudaMemcpyDeviceToHost);

    // Free device memory
    cudaFree(a);
    cudaFree(b);
    cudaFree(c);

    return 0;
}
