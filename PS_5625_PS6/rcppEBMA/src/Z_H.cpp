#include <Rcpp.h>
using namespace Rcpp;

NumericMatrix Z_H(NumericMatrix x, 
                  NumericVector y, 
                  NumericVector weights, 
                  double sd
){
  
  //Start here
  int rows = x.nrow();
  NumericMatrix dNormal(x);
  NumericMatrix out(x);
  
  //Calculates dnorm like for the R portion of inclass21:
  for (int l = 0; l < x.nrow(); ++l) {
    for (int k = 0; k < x.ncol(); ++k) {
      double datNumber = R::dnorm(y[l], x(l,k), sd, FALSE);
      dNormal(l,k) =  datNumber; // 
    }
  }
  
  //weights rows before the summation.
  NumericVector val(rows);
  for (int l = 0; l < rows; ++l) {
    
    double rowSum = 0;
    for (int k = 0; k < dNormal.ncol(); ++k) {
      rowSum += weights[k] * dNormal(l,k);
    }
    val[l] = rowSum;
  }
  
  
  // Calculates Z_H value.
  for (int l = 0; l < x.nrow(); ++l) {
    for (int k = 0; k < x.ncol(); ++k) {
      out(l,k) =  weights[k] * dNormal(l,k) / val[l]; // 
    }
  }
  
  // Equivalent to return() in R.
  return out;
}


// [[Rcpp::export]]