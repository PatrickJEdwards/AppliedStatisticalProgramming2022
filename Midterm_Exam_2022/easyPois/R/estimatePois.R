#' @name estimatePois
#' @title Estimate Relevant Statistics (Poisson Distribution)
#'
#' @description Function that estimates and returns relevant statistics for observed data that's presumably following a Poisson
#' distribution.
#'
#' @param y Original data; vector of non-negative integers.
#' @param SEtype Tells \code{standardError} function to use the \code{basic} or \code{bootstrap} method for calculating the standard error. \code{standardError} defaults to \code{bootstrap}.
#' @param B Number of samples for \code{bootstrap} method. The default is 100 samples.
#' @return Object of class \code{PoisMLE}.
#'
#' @author Patrick Edwards
#'
#' @examples
#' testy <- rpois(2000,3)
#' estPois <- estimatePois(y = testy, SEtype = "basic")
#' estPoisBootstrap <- estimatePois(y = testy, SEtype = "bootstrap", B = 200)
#'
#' @rdname estimatePois
#' @export
estimatePois <- function(y, SEtype = "bootstrap", B = 100){
  # Create necessary objects:
  SE <- standardError(y, SEtype, B)
  lambda <- mle(y)

  # Create error validation/checks.
  if(length(B) == 0){
    stop("ERROR! the number of samples 'B' must be one positive integer")
  }
  if(B <= 0 ){
    stop("ERROR! the number of samples 'B' must be a positive integer")
  }
  # Note that most of the potential error validation checks are not
  # necessary here because function 'PoisMLE' includes these error checks.

  # Finally, put all information about the five objects into the 'PoisMLE'
  # class generator function:
  PoissonMLE <- new(
    "PoisMLE",
    y = y, # Original data.
    MLE = lambda, # Maximum likelihood estimator (i.e., lambda from above).
    LL = logLik(y, lambda), # log likelihood.
    SE = SE, # Standard error for the MLE; generated above.
    SEtype = SEtype # Method used to calculate standard error.
  )
  return(PoissonMLE)
}
