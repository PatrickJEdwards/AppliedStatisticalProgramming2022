#include <Rcpp.h>
using namespace Rcpp;

NumericMatrix Z_H(
  NumericMatrix x,
  NumericVector y,
  NumericVectoctor W_H,
  double sd
);