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

# setwd("C:/Users/edwar/Documents/GitHub/AppliedStatisticalProgramming2022/Midterm_Exam_2022")
# Please change this to match your working directory.

# Load necessary packages for `easyPois` package:
usethis::use_package("methods")
usethis::use_package("stats")


# SETUP AND SANDBOX:
# This section documents my progress in creating the package.
# Including steps for each function where I create a toy version of the,
# function, test it with toy data, then create the actual '.R' file.



# **STEP 1**: Create Package.

# **NOTE**: If you plan to re-run the package creation process from here, then
# you might want to move outside a Github repository. `devtools` struggles to
# use the `create_packages` and other functions within Github repositories.
# This is apparently because `devtools` thinks that the Github repository is
# another active project, and therefore struggles to create another active
# project for the package within the Github repository.
# For more information, please check this `usethis` issue post:
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



# **STEP 2**: Define `poisMLE` Class.

## Create class `PoisMLE` generator function:
use_r("PoisMLE")

## Within `PoisMLE.R`, also create `setValidity` and `setMethod` functions.


