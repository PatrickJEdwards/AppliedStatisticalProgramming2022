#include <Rcpp.h>
using namespace Rcpp;


//' Z-Hat Computation.
//'
//' @param x Numeric matrix of model predictions.
//' @param y Vector of actual (observed) outcomes for each observation.
//' @param w Vector of weights with each element corresponding to a model.
//' @param sd Standard deviation.
//'
//' @export
// [[Rcpp::export]]

NumericMatrix Z_H(NumericMatrix x, NumericVector y, NumericVector w, double sd){
  
  // Start here, creates initial variables as well as normal matrices
  // Code builds off of my groups work in in class assignment 21
  int rows = x.nrow();
  NumericMatrix dNormal(x);
  NumericMatrix out(x);
  
  // Calculates dnorm like for the R portion of inclass21 assignment:
  for(int l = 0; l < x.nrow(); ++l){
    for(int k = 0; k < x.ncol(); ++k) {
      double dnorm_v = R::dnorm(y[l], x(l,k), sd, FALSE);
      dNormal(l,k) =  dnorm_v;
    }
  }
  // Weights rows before the summation. 
  // Parallels the summation in the denominator in equation
  NumericVector tot(rows);
  for (int l = 0; l < rows; ++l) {
    double rs = 0;
    for (int k = 0; k < dNormal.ncol(); ++k){
      rs += w[k] * dNormal(l,k);
    }
    tot[l] = rs;
  }
  // Calculates Z_H value.
  for (int l = 0; l < x.nrow(); ++l) {
    for (int k = 0; k < x.ncol(); ++k) {
      out(l,k) =  w[k] * dNormal(l,k) / tot[l]; 
    }
  }
  // Equivalent to return() in R. Returns matrix of z-hats
  return out;
}


