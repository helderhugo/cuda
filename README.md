# cuda
Basic code for testing CUDA

In this example, we have a CUDA kernel function addVectors that takes two input arrays a and b and an output array c, and adds the elements of the input arrays in parallel using the GPU. The main function allocates memory on the GPU, copies data from the host to the device, invokes the CUDA kernel, and then copies the results back to the host.

This example demonstrates the basic structure and syntax of a CUDA C++ source file, and shows how to transfer data to and from the GPU, launch a CUDA kernel, and perform basic error handling.
