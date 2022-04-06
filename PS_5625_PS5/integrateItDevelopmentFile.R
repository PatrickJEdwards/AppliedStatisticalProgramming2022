# File: `integrateItDevelopmentFile.R`
# Purpose: Package setup & Testing.
# Source: This script closely parallels the `DevelopmentFile.R` file
# from the devtoolsIntro.zip used in class for lecture 18.



## Load libraries and set working directory
library(devtools)
library(roxygen2)

# I use a temporary folder to create and organize the package.
# This is because packages made using `create_package()`
# "should not be nested inside another RStudio Project,
# R package, or Git repo" (Hadley & Bryan 2022, 'R Packages').

#setwd("~/PS5625_PS5_TempFolder")
#getwd()

setwd() #Change to match your directory


## Run this code once to create the initial package structure.
usethis::create_package("./integrateIt") # Creation of package framework.


## DO NOT DO THIS SEPARATELY!
##    Instead, include the steps to create
##    this data in the help file for each.
## Create example functions and data:
## Open within `integrateIt` R Project.
#getwd() # Should be inside `integrateIt` package.
#library(devtools)
#library(roxygen2)
# Check that `integrateIt` R Project is active.
#proj_get()
#load_all()
# Create two example functions:
#exampleFunction1 <- function(x) {
#  return(-x^2 + 50)
#}
#exampleFunction2 <- function(x) {
#  return(x^3 - x^2 - x + 50)
#}
## 1. Create common vector of values:
##exampleX <- -10:10
#names(exampleX) <- "Example X Values"
## 2. Create a vector of evaluated values
#example1Y <- exampleFunction1(exampleX)
#names(example1Y) <- "Example output Y from exampleX values put into exampleFunction1"
#example2Y <- exampleFunction2(exampleX)
#names(example2Y) <- "Example output Y from exampleX values put into exampleFunction2"
## 3. Grab starting/ending values of x:
#exampleLimits <- c(as.numeric(head(exampleX,
#                                   1)
#                     ),
#          as.numeric(tail(exampleX,
#                          1)
#                     )
#          )
#names(exampleLimits) <- "The upper & lower bounds (a, b) of exampleX"
## Create `data/` folder.
####dir.create("data/")
## Put these objects in the `data/` folder.
#usethis::use_data(example1Y,
#                  example2Y,
#                  exampleLimits,
#                  exampleX,
#                  exampleFunction1,
#                  exampleFunction2,
#                  internal = FALSE)
##



## This can be run many times as the code is updates
current.code <- as.package("squaresPack")
load_all(current.code)
document(current.code)


## REMAINING PORTION BELOW INCORRECT
## Let's look at a function

## Let's try it out
x<-c(1,2)
y<-c(3,4)
squaresObject <- addSquares(x, y)
squaresObject
