#include <Rcpp.h>
using namespace Rcpp;

// Reweighting function, similar to what was done on our in-class assignment.
NumericVector W_H(NumericMatrix zHat
                  ) {
  
  int rows = zHat.nrow();
  int cols = zHat.ncol();
  NumericVector out(cols);
  
  for (int k = 0; k < zHat.ncol(); ++k) {
    
    double newWeight = 0;
    
    for (int i = 0; i < zHat.nrow(); ++i) {
      newWeight +=  zHat(i,k);
    }
    out[k] = newWeight / rows;
  }
  return out;
}
