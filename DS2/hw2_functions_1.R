add2 <- function(x,y) { 
  x+y
}

above10 <- function(x) {
  use <- x>10
  x[use]
}

above <- function(x, n=10){ 
  use <- x > n
  x[use]
}

colmean <- function(x, removeNA = TRUE) {
  ## accepts a matrix
  nc <- ncol(x)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(x[,i],na.rm = removeNA)
  }
  return(means)
}

showquartiles <- function(y) {
  ## accepts a matrix of values
  stops <- numeric(5)
  stops[1] <- min(y)
  stops[5] <- max(y)
  for (i in 2:4) { 
    stops[i] <- stops[i-1] + sd(y)
  }
  return(stops)
}

histogramvals <- function(y) { 
  ## accepts a matrix of values
  ## depends on showquartiles() function
  stops <- showquartiles(y)
  buckets <- numeric(4)
  for (i in 1:4) { 
    boundaries <- c(stops[i]<= y,y < stops[i+1])
    buckets[i] <- length(y[boundaries])
  }
  return(buckets)
}