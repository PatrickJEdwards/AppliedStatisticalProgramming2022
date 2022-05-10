#include <Rcpp.h>
using namespace Rcpp;


NumericMatrix W_H(
    NumericMatrix x, 
    NumericVector y, 
    NumericVector weights, 
    double sd
  ){
  int rows = x.nrow();
  NumericMatrix dNormal(x);
  NumericMatrix out(x);
  
  for (
      int i = 0; 
      i < x.nrow(); 
      ++i
        ) {
    for (
        int j = 0; 
        j < x.ncol(); 
        ++j
          ) {
      double datNumber = R::dnorm(
        y[i], 
        x(i,j),
        sd, 
        FALSE);
      dNormal(i,j) =  datNumber; // 
    }
  }
  
  NumericVector sums(rows);
  for (int i = 0; i < rows; ++i) {
    
    double rowSum = 0;
    for (int j = 0; j < dNormal.ncol(); ++j) {
      rowSum += weights[j] * dNormal(i,j);
    }
    sums[i] = rowSum;
  }
  
  for (int i = 0; i < x.nrow(); ++i) {
    for (int j = 0; j < x.ncol(); ++j) {
      out(i,j) =  weights[j] * dNormal(i,j) / sums[i]; // 
    }
  }
  
  return out;
}


// [[Rcpp::export]]

