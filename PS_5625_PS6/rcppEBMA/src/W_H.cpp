#include <Rcpp.h>
using namespace Rcpp;


//' W-Hat Re-weighting Computation.
//'
//' @param Z_H Numeric matrix of z-hat values, derived in Z_H function
//'
//' @export
// [[Rcpp::export]]

NumericVector W_H(NumericMatrix Z_H){

// Reweighting function, similar to what was done on our in-class assignment.
  
  // Derive object for # of Z_hat rows:
  int rows = Z_H.nrow();
  
  // Derive object for # of Z_hat columns:
  int cols = Z_H.ncol();
  NumericVector out(cols);
  
  // Reweighting function. Code based on W-hat calculations done 
  //  for inclass assignment #21.
  for (int k = 0; k < Z_H.ncol(); ++k) {
    
    double nWeight = 0;
    
    // Inner for-loop sums the z-hats column-wise:
    for (int i = 0; i < Z_H.nrow(); ++i) {
      nWeight +=  Z_H(i,k);
    }
    //Column-wise sum of Z-hats are divided by the # of Z-hat rows.
    out[k] = nWeight / rows;
  }
  // Returns new weights:
  return out;
}