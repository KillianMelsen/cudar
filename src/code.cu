// Basic header file
#include <stdlib.h>
#include <string.h>

// CUDA runtime
#include <cuda_runtime.h>

// Device properties function ==============================================================================================
extern "C"
void getDeviceProps(int* id, char* deviceName, int* integr, int* mjr, int* mnr) {
  
    // Create CUDA device properties variable
    cudaDeviceProp prop;

    // Query GPU properties
    cudaGetDeviceProperties(&prop, *id);

    // Storing results
    strcpy(deviceName, prop.name);
    *integr = prop.integrated;
    *mjr = prop.major;
    *mnr = prop.minor;
}