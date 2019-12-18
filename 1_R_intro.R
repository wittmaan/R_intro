
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
#   https://www.r-project.org/


## Install RStudio

# - after finishing the setup you should see the "R" icon on your desktop
#   clicking on this would start up the standard interface

# - but using the RStudio IDE seems much more comfortable here
#   https://rstudio.com/




















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



















# Help and documentation

# - there is a large amount of documentation and help
#   avaiable 

help(rnorm)

?rnorm

example(rnorm)

# see also https://cran.r-project.org/manuals.html



















# Scripts

# - R is an interpreter that uses a command line 
#   based environment.
# - Commands and/or functions can be stored in scripts

source("foo.R")

add(10, 3)



















# Data Structures

## Vectors

vec1 <- c(1,4,6,8,10)
vec1

vec1[5]

vec1[3] <- 12
vec1


vec2 <- 1:20
vec2


vec3 <- seq(from=0, to=1, by=0.25)
vec3

sum(vec3)


vec1 + vec3

vec2 + vec3


## Matrices 

mat <- matrix(data = 1:12, ncol=3)

mat[1,]

mat[,1]

mat[1,3]

mean(mat)


## Data Frames

# - different data types can be used
# - must have the same length

d <- data.frame(x=rnorm(10), y=rexp(10), z=rep(c("a","b","c","d","e"), 2))

d$x

mean(d$x)

summary(d)


## Lists

# - different data types with different lengths can be used

l <- list(one=1, 
          two=c(1,2), 
          three=data.frame(a=1:3, b=4:6))
l



















# Graphics

plot(rnorm(200), type="l", col="blue")

hist(rnorm(200))

plot(d$x, type="l", col="blue", ylim=range(d[,1:2]))
lines(d$y, col="red")



















# Reading and writing data files

write.table(d, "dat.txt")

d2 <- read.table("dat.txt")



















# Missing data

a <- c(1,2,3,4,NA,6,NA,8,9,10)
summary(a)

mean(a)
mean(a, na.rm = TRUE)



















# Programming

## if-statements

w <- 3

if (w < 5) {
  d <- 2
} else {
  d <- 10
}

d


a <- 1:4
b <- 5:8
a[b==5 | b==8]


## for loop

n <- 10
#n <- 10^8
h <- 1:n
erg <- numeric(n)

for (i in 1:length(h)) {
  erg[i] <- h[i]^2
}
erg

h^2


## Function

fun1 <- function(a, b) {
  erg <- a^2
  return(b + erg)
}

fun1(a=3, b=5)



















# Statistics

# - The famous iris data set gives the measurements in centimeters of the variables sepal length and 
#   width and petal length and width, respectively, for 50 flowers from each of 3 species of iris.

iris

fit <- lm(Petal.Width ~ Petal.Length + Sepal.Length + Sepal.Width, data = iris)

summary(fit)



















# literature

# - https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf

# - https://github.com/ClaudiaBrauer/A-very-short-introduction-to-R/blob/master/documents/A%20(very)%20short%20introduction%20to%20R.pdf

# - https://rpubs.com/rslbliss/r_intro_ws

# - https://github.com/datadicts/Intro-to-R-2ed

# - https://github.com/datacamp/courses-introduction-to-r

# - https://github.com/jessesadler/intro-to-r



