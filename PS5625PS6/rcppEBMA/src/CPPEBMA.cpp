#include <Rcpp.h>
#include "ZH.h"
#include "WH.h"
using namespace Rcpp;

//' EBMA Calculation Using C++
//'
//' @param x Numeric matrix of  predictions from each model.
//' @param y Numeric vector of actual (observed) outcomes.
//' @param W_Hat Numeric vector of the weight assigned to each model.
//' @param sd Standard deviation.
//' @param tol Tolerance threshold after which iteration ends.
//'
//' @export

// [[Rcpp::export]]

NumericVector CPP_EBMA(NumericMatrix x, NumericVector y, NumericVector W_Hat, double sd, double tol){
  
  // If tolerance parameter is met, then the iteration does not run.
  bool threshold = FALSE;
  int iterations = 0;
  
  // Derive Z-hats as well. Then derive updated weights W-hats:
  while(threshold == FALSE){
    
    NumericMatrix new_zHats = Z_H(x, y, W_Hat, sd);
    
    NumericVector new_wHats = W_H(new_zHats);
    
    // This determines if the tolerance parameter has been met. 
    // TRUE if all elements in weights object fall below tol threshold.
    // If TRUE, then ends the iterated process and prints the total number of iterations
    
    LogicalVector difference = (abs((W_Hat - new_wHats)) < tol);
    
    if(is_true(all(difference))){
      threshold = TRUE;
    }
    else{
      W_Hat = new_wHats;
    }
    iterations = iterations + 1;
  }
  return W_Hat;
}