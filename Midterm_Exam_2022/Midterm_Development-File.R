# Package `easyPois` Development File!

## NOTE: This is an overview section that follows the development file
## from the in-class `devtoolsIntro` package.

## Code here can be rerun at any point in the development process.

# PRELIMINARIES:

## Load libraries and set working directory:
library(devtools)
library(roxygen2)
library(usethis)
library(methods)

## Please change this to match your working directory.
# setwd()

## This code can be run as many times as desired.
current.code <- as.package("easyPois")
devtools::load_all(current.code)
document(current.code) # Run to fill/update `MAN` files.


## Run to see if package meets CRAN minimal standards:
check("easyPois")

## Test package by trying main `estimatePois` function out:
y <- rpois(5000,3)
estimatePois(y, SEtype = "basic", B = 1000)
estimatePois(y, SEtype = "bootstrap", B = 1000)


## Check if functions trigger correct errors:
## negative y:
estimatePois(y = c(-100:-1), SEtype = "basic", B = 1000) #Yes.
estimatePois(y = c(-100:-1), SEtype = "bootstrap", B = 1000) #Yes.
## NA y:
estimatePois(y = c(1:5,NA,6:10), SEtype = "basic", B = 1000)
estimatePois(y = c(1:5,NA,6:10), SEtype = "bootstrap", B = 1000)
# Empty y:
estimatePois(y = c(), SEtype = "basic", B = 1000)
estimatePois(y = c(), SEtype = "bootstrap", B = 1000)
# Incorrect `SEtype` & `B` inputs:
estimatePois(y = c(1:10), SEtype = "garbage", B = 1000)
estimatePois(y = c(1:10), SEtype = "basic", B = 0)
estimatePois(y = c(1:10), SEtype = "bootstrap", B = 0)



# SECTION 2: Outline of package setup Steps
# This section documents my progress in creating the package.
# Including steps for each function where I create a toy version of the,
# function, test it with toy data, then create the actual '.R' file.



# **STEP 1**: Create Package.

## **NOTE**: If you plan to re-run the package creation process from here, then
## you might want to move outside a Github repository. `devtools` struggles to
## use the `create_packages` and other functions within Github repositories.
## This is apparently because `devtools` thinks that the Github repository is
## another active project, and therefore struggles to create another active
## project for the package within the Github repository.
## For more information, please check this `usethis` issue post:
usethislink <- "https://github.com/r-lib/usethis/issues/1020"

# SET TO YOUR DIRECTORY:
## create_package("C:/Users/edwar/Documents/PS5625_Midterm_Temp_Folder/easyPois")

# This should have opened another R session inside the `easyPois` active
# project. Once again, you might need to move it out of the Github repository
# for this and subsequent functions to work properly.

# Preliminaries 2: Reload devtools, roxygen2.
library(devtools)
library(roxygen2)
library(usethis)

# Set Working Directory inside active project:
setwd("C:/Users/edwar/Documents/PS5625_Midterm_Temp_Folder/easyPois")

# (Optional) Create Git repository:
## use_git()

# Load necessary packages for `easyPois` package:
usethis::use_package("methods")
usethis::use_package("stats")

# Set license (to pass check function):
use_mit_license()



# **STEP 2**: Define `poisMLE` Class.

## Create class `PoisMLE` generator function:
use_r("PoisMLE")

## Within `PoisMLE.R`, also create `setValidity` and `setMethod` functions.



# **STEP 3**: Define  logLik function.

# First, I create and test the `logLik` function and test it with self-created
# data. Second, I create the `logLik.R` file and fill it in with the function
# and example data.

# Create `logLik` function:
logLik <- function(y, lambda){

  # Extract the number of observations `n`:
  n <- length(y)

  # Create first term in equation:
  term1 <- -n*lambda

  # Create factorial of each value in `y`:
  fac_y <- factorial(y)

  # Create second term in equation:
  term2 <- -sum(log(fac_y))

  # Create third term in equation:
  term3 <- log(lambda)*sum(y)

  # Calculate log likelihood by combining the three terms.
  LL <- term1 + term2 + term3

  return(LL)
}
## Test with created data:
y <- c(1:4,3,3,6,1,7:5,11,8,10)
lambda <- 5
logLik(y, lambda) # Works fine.
rm(y,lambda,logLik)

## Create R file for function `logLik` in package:
# use_r("logLik")



# **STEP 4**: Define the `mle` function.

# First, I create a sandbox version of the `mle` function and calculate the
# maximum likelihood estimator for lambda. Then, I create the `mle.R` file
# and fill it in with the function and example use.

## Create `mle` function.
mle <- function(y){
  n <- length(y)
  MLE <- sum(y)/n
  return(MLE)
}
## Test `mle` function with toy data:
ytest <- c(1:4,3,7:5,11)
mle(y = ytest) # works fine
rm(ytest,mle)

## Create `mle.R` file in package:
# use_r("mle")



# **STEP 5**: Define the `standardError` function.

# I first create the `standardError` function, then I test it using toy data.

# Create sandbox 'standardError' function and test that it works.
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
  else{error("Invalid input for SEtype")}
}
# Test this function with toy data.
testy <- rpois(2000,3)
standardError(y = testy, SEtype = "basic", B = 50)
standardError(y = testy, SEtype = "bootstrap", B = 500)

rm(testy, standardError)

## Create `standardError.R` file in package:
#use_r("standardError")



# **Step 6**: Create `estimatePois` function that ties the package together:

# Create 'estimatePois.R' file:
#use_r("estimatePois")



# **Step 6**: Check that package works correctly.
## Use Portion in the first section.
