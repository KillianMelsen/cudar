#include <Rcpp.h>
#include <stdlib.h>
using namespace Rcpp;

extern "C"
void getDeviceProps_CUDA(int id, char* DeviceName, int* integr, int* mjr, int* mnr);

// Device properties function
//[[Rcpp::export(.getDeviceProps)]]
List getDeviceProps(const int& id) {
  
  // Create variables for storing results
  char deviceName[256];
  int integr, mjr, mnr;
  
  // Call to CUDA code
  getDeviceProps_CUDA(id, deviceName, &integr, &mjr, &mnr);
  
  // Returning results to R
  return List::create(Named("id") = id,
                      Named("deviceName") = deviceName,
                      Named("integr") = integr,
                      Named("mjr") = mjr,
                      Named("mnr") = mnr);
}
