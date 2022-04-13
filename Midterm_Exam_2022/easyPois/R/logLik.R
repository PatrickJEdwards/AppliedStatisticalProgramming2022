#' @name logLik
#' @title Calculate Logged Likelihood (Poisson Distribution)
#'
#' @description Calculates logged likelihood of the observed data given a value of lambda
#'
#' @param y Original data; vector of non-negative integers
#' @param lambda The assumed value of the lambda estimate
#'
#' @return An object `LL` containing the log likelihood estimate
#' @author Patrick Edwards
#' @examples
#'
#' ytest <- rpois(2000,3)
#' logLik(y = ytest, lambda = 5)
#'
#' @rdname logLik
#'
#' @export
logLik <- function(y, lambda){
  # Extract the number of observations `n`:
  n <- length(y)

  # Create first term in equation:
  term1 <- -n*lambda

  ## Create factorial of each value in `y`:
  fac_y <- factorial(y)

  # Create second term in equation:
  term2 <- -sum(log(fac_y))

  # Create third term in equation:
  term3 <- log(lambda)*sum(y)

  # Calculate log likelihood by combining the three terms.
  LL <- term1 + term2 + term3

  # Include redundant error messages to catch incorrect inputs:
  if(any(y < 0)){
    stop("ERROR! Elements of 'y' cannot obtain values less than zero")
  }
  if(length(y) == 0){
    stop("ERROR! 'y' must contain at least one non-negative integer element")
  }
  if(length(lambda) != 1){
    stop("ERROR! Please provide only one value of Lambda")
  }
  if(lambda < 0){
    stop("ERROR! Lambda cannot obtain values less than zero")
  }
  return(LL)
}
