## CPPEBMA Dev File
library(Rcpp)
library(devtools)
#install.packages("roxygen2")
library(roxygen2)


# SET TO YOUR OWN WORKING DIRECTORY
setwd("~/GitHub/AppliedStatisticalProgramming2022/PS5625PS6")
getwd()


## CPEBMA Dev File: Demonstration of Functionality:

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
initialwHats <- replicate(K,1/K)

# Test Z-hat function:
zhatTest <- Z_H(
  x = x,
  y = y,
  w = initialwHats, 
  sd = 1
)

# Test W-at (weighting) function:
whatTest <- W_H(z = zhatTest)

# Test whole EBMA function:
CPPEBMAtest <- rcppEBMA::CPP_EBMA(
  x = x,
  y = y,
  WHat = initialwHats,
  sd = 1,
  tol = 0.0001
)






# Create Package:
funcDir <- "~/1. Washington University in St. Louis/5. Spring 2022 Semester/Pol Sci 5625 Applied Statistical Programming/rcppEBMA/"
Rcpp.package.skeleton(
  name = "rcppEBMA",
  cpp_files = c(
    paste(funcDir, "ZH.h", sep = ""),
    paste(funcDir, "CPPEBMA.cpp", sep = ""),
    paste(funcDir, "WH.cpp", sep = ""),
    paste(funcDir, "WH.h", sep = ""),
    paste(funcDir, "ZH.cpp", sep = ""),
    paste(funcDir, "ZH.h", sep = "")
  ),
  author = "Patrick Edwards",
  email = "edwards.p@wustl.edu"
)


## This code can be run as many times as desired.
current.code <- as.package("rcppEBMA")

# Compiling attributes of Rcpp:
setwd("~/GitHub/AppliedStatisticalProgramming2022/PS5625PS6/rcppEBMA")
getwd()
Rcpp::compileAttributes()

# Load All:
setwd("~/GitHub/AppliedStatisticalProgramming2022/PS5625PS6")
getwd()

current.code <- as.package("rcppEBMA")
document(current.code) # Run to fill/update `MAN` files.

current.code <- as.package("rcppEBMA")
devtools::load_all(current.code)

# Check documentation files:
?rcppEBMA
?rcppEBMA::Z_H
?rcppEBMA::W_H
?rcppEBMA::CPP_EBMA





