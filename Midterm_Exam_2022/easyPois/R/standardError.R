#' @name standardError
#' @title Standard Error (Poisson Distribution)
#'
#' @description This function calculates the standard error for observed data following
#' the Poisson distribution.
#'
#' @param y Original data; vector of non-negative integers.
#' @param SEtype Tells \code{standardError} function to use the \code{basic}
#' or \code{bootstrap} method for calculating the standard error.
#' \code{standardError} defaults to \code{bootstrap}.
#' @param B Number of samples for \code{bootstrap} method. The default is
#' 100 samples.
#' @return The standard error of the observed data.
#'
#' @author Patrick Edwards
#' @examples
#'
#' testy <- rpois(2000,3)
#'
#' standardError(y = testy, SEtype = "basic", B = 50)
#' standardError(y = testy, SEtype = "bootstrap", B = 500)
#'
#' @rdname standardError
#'
#' @export
standardError <- function(y, SEtype, B = 100){

  # Create 'basic' standardError function.
  if(SEtype == "basic"){
    # Use `mle` function already in package:
    SE <- sqrt(mle(y)/length(y))
    return(SE)
  }
  else if(SEtype == "bootstrap"){
    n <- length(y)

    # 1. Create 'B' samples from 'y' of size 'n':
    samples <- replicate(
      B,
      sample(
        y,
        size = n,
        replace = TRUE
      )
    )
    # Output is an n by B matrix. Each column is a sample, with all samples
    # being 'n' rows long.

    # 2. Calculate the MLE for each sample:
    MLE_vec <- apply(samples, 2, mle)
    # Output is a vector of MLEs for each sample
    # (i.e., columns of aforementioned matrix).

    # 3. Find the standard deviation of 'mle_vec':
    SE <- stats::sd(MLE_vec)

    return(SE)
  }
  # Throw an error if neither works.
  else{stop("Invalid input for SEtype")}
}
