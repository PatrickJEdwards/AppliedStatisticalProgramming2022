# Package `easyPois` Development File!


## SECTION 1: code here can be rerun at any point in the development process.
### NOTE: This is an overview section that follows the development file
### from the in-class `devtoolsIntro` package.

# PRELIMINARIES:

## Load libraries and set working directory:
library(devtools)
library(roxygen2)
library(usethis)
library(methods)

## Please change this to match your working directory.
setwd("C:/Users/edwar/Documents/GitHub/AppliedStatisticalProgramming2022/Midterm_Exam_2022/easyPois")

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
estimatePois(y, SEtype = "bootstrap")

## Check if functions trigger correct errors:
### negative y:
estimatePois(y = c(-100:-1), SEtype = "basic", B = 1000) #Yes.
estimatePois(y = c(-100:-1), SEtype = "bootstrap", B = 1000) #Yes.
### NA y:
estimatePois(y = c(1:5,NA,6:10), SEtype = "basic", B = 1000)
estimatePois(y = c(1:5,NA,6:10), SEtype = "bootstrap", B = 1000)
### Empty y:
estimatePois(y = c(), SEtype = "basic", B = 1000)
estimatePois(y = c(), SEtype = "bootstrap", B = 1000)
### Incorrect `SEtype` & `B` inputs:
estimatePois(y = c(1:10), SEtype = "garbage", B = 1000)
estimatePois(y = c(1:10), SEtype = "basic", B = 0)
estimatePois(y = c(1:10), SEtype = "bootstrap", B = 0)



## SECTION 2: outline of package setup steps.
### This section documents the broad steps I took in creating this package.


## **STEP 1**: Create Package.
## **NOTE**: If you plan to re-run the package creation process from here, then
### you might want to move outside a Github repository. `devtools` struggles to
### use the `create_packages` and other functions within Github repositories.
### For more information, please check this `usethis` issue post:
#usethislink <- "https://github.com/r-lib/usethis/issues/1020"

## SET TO YOUR DIRECTORY:
#create_package("C:/Users/edwar/Documents/PS5625_Midterm_Temp_Folder/easyPois")

## Load necessary packages for `easyPois` package:
#usethis::use_package("methods")
#usethis::use_package("stats")

## Set license (to pass check function):
#use_mit_license()



## **STEP 2**: Define `poisMLE` Class.
### Create class `PoisMLE` generator function:
#use_r("PoisMLE")



## **STEP 3**: Define  logLik function.
### Create R file for function `logLik` in package:
#use_r("logLik")



## **STEP 4**: Define the `mle` function.
### Create `mle.R` file in package:
#use_r("mle")



## **STEP 5**: Define the `standardError` function.
### Create `standardError.R` file in package:
#use_r("standardError")



## **Step 6**: Create `estimatePois` function that ties the package together:
### Create 'estimatePois.R' file:
#use_r("estimatePois")



## **Step 6**: Check that package works correctly.
### Use Portion in the first section.

