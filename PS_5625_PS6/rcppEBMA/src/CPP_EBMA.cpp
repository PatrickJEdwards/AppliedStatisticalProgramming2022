#include <Rcpp.h>
#include "Z_H.h"
#include "W_H.h"
#include <iostream>
#include <cmath>
using namespace Rcpp;

//' EBMA Calculation Using C++
//'
//' @param x Numeric matrix of  predictions from each model.
//' @param y Numeric vector of actual (observed) outcomes.
//' @param W_Hats Numeric vector of the weight assigned to each model.
//' @param sd Standard deviation.
//' @param tol Tolerance threshold after which iteration ends.
//'
//' @export
// [[Rcpp::export]]
NumericVector CPP_EBMA(NumericMatrix x, NumericVector y, NumericVector W_Hats, double sd, double tol){
  
  // If tolerance parameter is met, then the iteration does not run.
  bool thresh = FALSE;
  int iterations = 0;
  
  // Derive Z-hats as well as updated weights W-hats:
  while(thresh == FALSE){
    
    NumericMatrix C_Z_H = Z_H(x, y, W_Hats, sd);
    
    NumericVector nWeights = W_H(C_Z_H);
    
    // This determines if the tolerance parameter has been met. 
    // TRUE if all elements in weights object fall below tol threshold.
    // If TRUE, then ends the iterated process and prints the total number of iterations
    
    LogicalVector diff = (abs((W_Hats - nWeights)) < tol);
    
    if(is_true(all(diff))){
      thresh = TRUE;
    }
    else{
      W_Hats = nWeights;
    }
    iterations = iterations + 1;
  
  }
  
  return W_Hats;
}