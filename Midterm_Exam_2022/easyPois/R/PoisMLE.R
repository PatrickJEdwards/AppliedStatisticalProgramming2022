#' @name PoisMLE
#' @title Create Poisson MLE S4 Class Generator Function
#'
#' @description Object of class \code{PoisMLE} as created by the \code{PoisMLE} function. An object of class `PoisMLE` has the following slots:
#'
#' @slot y Original data; vector of non-negative integers.
#' @slot MLE The maximum likelihood estimator.
#' @slot LL The log likelihood that was calculated from the observed data (assuming that the MLE is correct).
#' @slot SE The MLE's standard error.
#' @slot SEtype The method by which the standard errors are  This can be either \code{basic} or \code{bootstrap}.
#' @author Patrick Edwards
#' @rdname PoisMLE

# Create the class `PoisMLE`:
## NOTE: this heavily references the package shared during the "Packages & S4 Classes" Lecture.
setClass(
  Class = "PoisMLE",
  representation = representation(
    y = "numeric",
    MLE = "numeric",
    LL = "numeric",
    SE = "numeric",
    SEtype = "character"
  ),
  prototype = prototype(
    y = NA_real_,
    MLE = NA_real_,
    LL = NA_real_,
    SE = NA_real_,
    SEtype = NA_character_
  )
)

# setValidity for `PoisMLE`:
setValidity("PoisMLE", function(object){

  # Ensure y value is a finite, positive, integer object.
  t1 <- any(is.infinite(object@y)) # Check if infinite.
  t2 <- any((object@y - floor(object@y)) != 0) # Check if not integer
  t3 <- any(object@y < 0) # Check if less than zero.
  t4 <- any(is.na(object@y)) # Check if NA.

  if(any(t1,t2,t3,t4)){
    stop("@y contains an element that's either missing or not a finite, zero, or positive integer")
  }

  # Ensure that SEtype input is either "basic" or "bootstrap":
  t5 <- any((object@SEtype != "basic") & (object@SEtype != "bootstrap"))
  t6 <- length(object@SEtype) != 1 # Check that the input is only one.

  if(any(t5,t6)){
    stop("@SEtype is not 'basic' or bootstrap'")
  }

  # Ensure that elements of this class' objects result from package functions:
  ## Test @MLE object:
  if(mle(object@y) != object@MLE){
    stop("@MLE incorrect: does not match 'mle' function output.")
  }
  ## Test @LL object:
  if(logLik(y = object@y, lambda = object@MLE) != object@LL){
    stop("@LL incorrect. Does not match 'logLik' function output.")
  }
}
)


# setMethod for `PoisMLE`:
#' @import methods
setMethod(
  "initialize", "PoisMLE",
  function(.Object, ...) {
    value <- callNextMethod()
    validObject(value)
    return(value)
  }
)

