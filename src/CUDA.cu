#include <stdlib.h>
#include <string.h>
#include <cuda_runtime.h>

extern "C"
void getDeviceProps_CUDA(int id, char* DeviceName, int* integr, int* mjr, int* mnr) {
  
  // Create CUDA device properties variable
  cudaDeviceProp prop;
  
  // Query GPU properties
  cudaGetDeviceProperties(&prop, id);
  
  // Storing results
  strcpy(DeviceName, prop.name);
  *integr = prop.integrated;
  *mjr = prop.major;
  *mnr = prop.minor;
}