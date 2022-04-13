#' @name mle
#' @title Calculate the maximum likelihood estimator
#'
#' @description Calculates the maximum likelihood estimator for lambda given observed data.
#'
#' @param y Original data; vector of non-negative integers.
#'
#' @return Object `MLE` containing the calculated maximum likelihood estimator.
#' @author Patrick Edwards
#' @examples
#'
#' ytest <- rpois(2000,3)
#' mle(y = ytest)
#'
#' @rdname mle
#'
#' @export
mle <- function(y){
  n <- length(y)
  MLE <- sum(y)/n
  # Add redundant errors to trigger if something is wrong:
  if(any(is.na(object@y))){
    stop("ERROR! Observed data vector `y` cannot contain missing elements!")
  }
  if(any(is.infinite(object@y))){
    stop("ERROR! Observed data vector `y` cannot be infinite!")
  }
  if(any((object@y - floor(object@y)) != 0)){
    stop("ERROR! Observed data vector `y` must be a non-negative integer!")
  }
  if(any(y < 0)){
    stop("ERROR! Observed data vector 'y' cannot be negative")
  }
  if(length(y) == 0){
    stop("ERROR! observed data vector 'y' must have more than zero elements")
  }
  return(MLE)
}
