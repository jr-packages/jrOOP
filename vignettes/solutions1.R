## ----echo=FALSE----------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = TRUE)

## ---- tidy=FALSE, echo = TRUE--------------
arg_explore = function(arg1, rg2, rg3){
    paste("a1, a2, a3 = ", arg1, rg2, rg3)
}

## ---- eval=FALSE, echo = TRUE--------------
#  arg_explore(1, 2, 3)
#  arg_explore(2, 3, arg1 = 1)
#  arg_explore(2, 3, a = 1)
#  arg_explore(1, 3, rg = 1)

## ---- tidy=FALSE---------------------------
## SOLUTION
## See http://goo.gl/NKsved for the offical document
## To summeriase, matching happens in a three stage pass:
#1. Exact matching on tags
#2. Partial matching on tags.
#3. Positional matching

## ---- fig.keep="none", echo = TRUE---------
sample(size = 10, TRUE, x = c(1,2,3,4))

## ---- results='hide', echo = TRUE----------
sample(10, TRUE, x = c(1,2,3,4))

## ---- tidy=FALSE, results='hide', fig.keep='none'----
## SOLUTION
#sample(size = 10, TRUE, x = c(1,2,3,4)) is equivilent to
sample(x = c(1,2,3,4), size = 10, replace = TRUE)
#sample(10, TRUE, x = c(1,2,3,4)) is also equivilent to
sample(x = c(1,2,3,4), size = 10, replace = TRUE)

## ---- results='hide', echo = TRUE----------
f = function(x) return(x + 1)
f(10)

## ----  tidy=FALSE--------------------------
##Nothing strange here. We just get
f(10)

## ---- results='hide', echo = TRUE----------
f = function(x) {
  f = function(x) {
    x + 1
  }
  x = x + 1
  return(f(x))
}
f(10)

## ---- results='hide', echo = TRUE----------
f = function(x) {
  f = function(x) {
    f = function(x) {
      x + 1
    }
    x = x + 1
    return(f(x))
  }
  x = x + 1
  return(f(x))
}
f(10)

## ---- message = FALSE----------------------
## Solution: The easiest way to understand is to use print statements
f = function(x) {
  f = function(x) {
    f = function(x) {
      message("f1: = ", x)
      x + 1
    }
    message("f2: = ", x)
    x = x + 1
    return(f(x))
  }
  message("f3: = ", x)
  x = x + 1
  return(f(x))
}
f(10)

## ---- results='hide'-----------------------
f = function(x) {
  f = function(x) {
    x = 100
    f = function(x) {
      x + 1
    }
    x = x + 1
    return(f(x))
  }
  x = x + 1
  return(f(x))
}
f(10)

## ----  results='hide'----------------------
##Solution: The easiest way to understand is to use print statements as above

## ---- eval=FALSE, echo = TRUE--------------
#  library("jrOOP")
#  vignette("solutions1", package="jrOOP")

