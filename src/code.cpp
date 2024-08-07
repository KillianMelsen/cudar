#include <Rcpp.h>
#include <stdlib.h>
#include <string.h>
#include <cuda_runtime.h>
using namespace Rcpp;

// Device properties function
//[[Rcpp::export(.getDeviceProps)]]
List getDeviceProps(const int& id) {
  
  // Create CUDA device properties variable
  cudaDeviceProp prop;
  
  // Query GPU properties
  cudaGetDeviceProperties(&prop, id);
  
  // Storing and returning results
  char deviceName[256];
  strcpy(deviceName, prop.name);
  return List::create(Named("id") = id,
                      Named("deviceName") = deviceName,
                      Named("integr") = prop.integrated,
                      Named("mjr") = prop.major,
                      Named("mnr") = prop.minor);
}
