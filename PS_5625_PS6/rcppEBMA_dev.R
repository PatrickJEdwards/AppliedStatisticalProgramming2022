## CPP_EBMA Dev File
library(Rcpp)
library(devtools)
#install.packages("roxygen2")
library(roxygen2)


# SET TO YOUR OWN WORKING DIRECTORY
setwd("~/GitHub/AppliedStatisticalProgramming2022/PS_5625_PS6")
getwd()


## CP_EBMA Dev File: Demonstration of Functionality:

# Load test data: Presidential Forecasts data from Montgomery et al. (2012).
library(EBMAforecast)
df <- EBMAforecast::presidentialForecast

# Preliminaries:
load_all("rcppEBMA")

y <- as.matrix(df$Actual) # Actual Outcomes.
x <- as.matrix(df[,1:6]) # Predictions
K <- dim(df)[2] - 1 # Num. of Models (columns of x)
N <- dim(df)[1] # Num. of observations (rows)

# Initial weights (assumed equal predictive power):
w_hat <- replicate(K,1/K)

# Test Z-hat function:
zhatTest <- Z_H(
  x = x,
  y = y,
  W_H = w_hat, 
  sd = 1
)

# Test W-at (weighting) function:
whatTest <- W_H(Z_H = zhatTest)

# Test whole EBMA function:
CPP_EBMA_Test <- CPP_EBMA(
  x = x,
  y = y,
  W_Hats = w_hat,
  sd = 1,
  tol = 0.0
)














## Create Package:
#funcDir <- "~/1. Washington University in St. Louis/5. Spring 2022 Semester/Pol Sci 5625 Applied Statistical Programming/rcppEBMA/"
#Rcpp.package.skeleton(
#  name = "rcppEBMA",
#  cpp_files = c(
#    paste(funcDir, "Z_H.h", sep = ""),
#    paste(funcDir, "CPP_EBMA.cpp", sep = ""),
#    paste(funcDir, "W_H.cpp", sep = ""),
#    paste(funcDir, "Z_H.h", sep = ""),
#    paste(funcDir, "Z_H.cpp", sep = ""),
#    paste(funcDir, "Z_H.h", sep = "")
#  ),
#  author = "Patrick Edwards",
#  email = "edwards.p@wustl.edu"
#)


## This code can be run as many times as desired.
current.code <- as.package("rcppEBMA")

# Compiling attributes of Rcpp:
setwd("~/GitHub/AppliedStatisticalProgramming2022/PS_5625_PS6/rcppEBMA")
getwd()
Rcpp::compileAttributes()

# Load All:
setwd("~/GitHub/AppliedStatisticalProgramming2022/PS_5625_PS6")
getwd()
current.code <- as.package("rcppEBMA")
devtools::load_all(current.code)

# Fill documentation
document(current.code) # Run to fill/update `MAN` files.


# Load functions from package:
load_all("rcppEBMA")

# Check documentation files:
?rcppEBMA
?rcppEBMA::Z_H
?rcppEBMA::W_H
?rcppEBMA::CPP_EBMA





