## CPP_EBMA Dev File
library(Rcpp)
library(devtools)
#install.packages("roxygen2")
library(roxygen2)

example(source) # defines the sourceDir() function
roxygen2::roxygenize("rcppEBMAtest")


workDir <- "C:/Users/edwar/Documents/TestFile"
funcDir <- "~/1. Washington University in St. Louis/5. Spring 2022 Semester/Pol Sci 5625 Applied Statistical Programming/rcppEBMA/"

setwd(workDir)
getwd()


Rcpp.package.skeleton(
  name = "rcppEBMAtest",
  cpp_files = c(
    paste(funcDir, "Z_H.h", sep = ""),
    paste(funcDir, "CPP_EBMA.cpp", sep = ""),
    paste(funcDir, "W_H.cpp", sep = ""),
    paste(funcDir, "Z_H.h", sep = ""),
    paste(funcDir, "Z_H.cpp", sep = ""),
    paste(funcDir, "Z_H.h", sep = "")
  ),
  author = "Patrick Edwards",
  email = "edwards.p@wustl.edu"
)


setwd("C:/Users/edwar/Documents/TestFile")
Rcpp::compileAttributes("rcppEBMAtest")



current.code <- as.package("rcppEBMAtest")
Rcpp::compileAttributes(pkgdir = paste(workDir, "rcppEBMA3", sep = ""))
devtools::load_all(current.code)
document(current.code) # Run to fill/update `MAN` files.








# SET TO YOUR OWN WORKING DIRECTORY
setwd("~/GitHub/AppliedStatisticalProgramming2022/PS_5625_PS6/rcppEBMA3")
getwd()
workDir <- paste(workDir, "/", sep = "")


## Create Package:
funcDir <- "~/1. Washington University in St. Louis/5. Spring 2022 Semester/Pol Sci 5625 Applied Statistical Programming/rcppEBMA/"
Rcpp.package.skeleton(
  name = "rcppEBMA3",
  cpp_files = c(
    paste(funcDir, "Z_H.h", sep = ""),
    paste(funcDir, "CPP_EBMA.cpp", sep = ""),
    paste(funcDir, "W_H.cpp", sep = ""),
    paste(funcDir, "Z_H.h", sep = ""),
    paste(funcDir, "Z_H.cpp", sep = ""),
    paste(funcDir, "Z_H.h", sep = "")
  ),
  author = "Patrick Edwards",
  email = "edwards.p@wustl.edu"
)


## This code can be run as many times as desired.
current.code <- as.package("rcppEBMA3")
Rcpp::compileAttributes(pkgdir = paste(workDir, "rcppEBMA3", sep = ""))
devtools::load_all(current.code)
document(current.code) # Run to fill/update `MAN` files.

Rcpp::compileAttributes(
  pkgdir = "rcppEBMA"
)


?Rcpp.package.skeleton()

# Update to automatically complete documentation:
compileAttributes(
  pkgdir = "rcppEBMA",
  verbose = getOption("verbose")
)

#?compileAttributes()


# Load functions from package:
load_all()

