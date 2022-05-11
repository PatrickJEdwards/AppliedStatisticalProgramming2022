#include <Rcpp.h>
using namespace Rcpp;


//' W-Hat Re-weighting Computation.
//'
//' @param z Numeric matrix of z-hat values, derived in Z hat function
//'
//' @export
// [[Rcpp::export]]

NumericVector W_H(NumericMatrix z){

// Reweighting function, similar to what was done on our in-class assignment.
  
  // Derive object for # of z rows:
  int rows = z.nrow();
  
  // Derive object for # of z columns:
  int cols = z.ncol();
  NumericVector out(cols);
  
  // Reweighting function. Code based on W-hat calculations done 
  //  for inclass assignment #21.
  for (int k = 0; k < z.ncol(); ++k) {
    
    double nWeight = 0;
    
    // Inner for-loop sums the z-hats column-wise:
    for (int i = 0; i < z.nrow(); ++i) {
      nWeight +=  z(i,k);
    }
    //Column-wise sum of Z-hats are divided by the # of Z-hat rows.
    out[k] = nWeight / rows;
  }
  // Returns new weights:
  return out;
}