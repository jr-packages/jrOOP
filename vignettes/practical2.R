## ----echo=FALSE----------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = FALSE)

## ------------------------------------------
methods("mean")

## ----results="hide"------------------------
body("mean")

## ------------------------------------------
args("mean")

## ----results='hide'------------------------
mean.cohort = function(x, ...) {
  m1 = mean(x$details[, 1], ...)
  m2 = mean(x$details[, 2], ...)
  return(c(m1, m2))
}

## ------------------------------------------
sd = function(x, ...) UseMethod("sd")
sd.default = function(x, ...) stats::sd(x, ...)
sd.cohort = function(x, ...) {
  s1 = sd(x$details[, 1], ...)
  s2 = sd(x$details[, 2], ...)
  return(c(s1, s2))
} 

## ------------------------------------------
## summary is already a generic
body(summary)

## Match the args
args(summary)

## Function
summary.cohort = function(object, ...) summary(object$details, ...)

## ------------------------------------------
## hist is already a generic
body(hist)

## Match the args
args(hist)

## Function
hist.cohort = function(x, ...) {
  dd = x$details
  Weight = ggplot(dd, aes(x = weight)) + 
    geom_histogram() + 
    labs(title = "Weight")
  Height = ggplot(dd, aes(x = height)) + 
      geom_histogram() + 
      labs(title = "Height")
  gridExtra::grid.arrange(Weight, Height)
}

## ---- eval=FALSE, echo = TRUE--------------
#  cc[1:3,]

## ------------------------------------------
## Lots of methods available. 
methods("[")

## Examine [.data.frame
args("[.data.frame")

"[.cohort" = function(x, ...) {
  x$details = x$details[...]
  x
}

## ---- eval=FALSE, echo = TRUE--------------
#  cc[1,1] = 10

## ---- eval = FALSE-------------------------
#  ## Lots of methods available.
#  methods('[<-')
#  
#  ## Examine [.data.frame
#  args('[<-.data.frame')
#  
#  '[<-.cohort' = function(x, i, j, value) {
#    x$details[i, j] = value
#    x
#  }
#  cc[1:3, ] = 55

## ---- eval=FALSE, echo = TRUE--------------
#  library("jrOOP")
#  vignette("solutions2", package="jrOOP")
