
# *******************************************************************
#  Short introduction to R
#  Andreas Wittmann
# *******************************************************************



















# Introduction

# - R is a powerful language and environment for statistical computing and graphics.

# - The main advantages of R are the fact that R is freeware and that there is a
#   lot of help available online.

# - It is quite similar to other programming packages such as MatLab (not freeware),
#   but more user-friendly than programming languages such as C++ or Fortran.

# - Only little disadvantage: searching for errors / problems and R is not always
#   easy at google.com



















# Getting started

## Install R

# - to install R on your computer go the the home website of R
#   https://cran.r-project.org/bin/windows/base/


## Install RStudio

# - after finishing the setup you should see the "R" icon on your desktop
#   clicking on this would start up the standard interface

# - but using the RStudio IDE seems much more comfortable here
#   https://rstudio.com/products/rstudio/download/




















# RStudio Layout

# - Bottom left: console window, execute command directly
# - Top left: script window, working with script, CTRL + ENTER to send 
#   it to command window
# - Top right: workspace, history window
# - Bottom right: file, plots, packages, help, viewer window



















# Working directory

# get the current working directory
getwd()

# set working directory
setwd("some path and directory")



















# Packages

# - specific functionalities / addons in R are organized in packages
# list all install libraries
library()

# installs the package "geometry"
install.packages("geometry")

# loads the package
library("geometry")



















# Examples of R commands

## Calculator

10^2 + 36


## Workspace

a <- 4
a
a * 5

a <- a + 10
a


# - remove all variables from R's memory
ls()
rm(list=ls())


## Scalars, vectors and matrices

b <- c(3, 4, 5)
b


## Functions

(3+4+5)/3

mean(b)

rnorm(10)

rnorm(10, mean = 1.2, sd = 3.4)


## Plots

x <- rnorm(100)

plot(x)



















# literature

#- https://github.com/ClaudiaBrauer/A-very-short-introduction-to-R/blob/master/documents/A%20(very)%20short%20introduction%20to%20R.pdf

#- https://rpubs.com/rslbliss/r_intro_ws

#- https://github.com/datadicts/Intro-to-R-2ed

#- https://github.com/datacamp/courses-introduction-to-r

#- https://github.com/jessesadler/intro-to-r



