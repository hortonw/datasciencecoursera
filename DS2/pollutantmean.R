pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) { 
  ## return a mean value of a specified measure from a directory full of csv files
  
  ## first, check for proper value of pollutant
  if (pollutant != "sulfate" && pollutant != "nitrate") { 
    return("Please enter a proper value for 'pollutant' (either 'sulfate' or 'nitrate')")
  }
  
  ## check for proper range identification
  if (max(id) > 332) { 
    return("Sorry, there are only 332 weather stations providing data. please change your range")
  }
  
  ## build an array of values from the specified range. 
  m <- matrix (nrow = length(id),ncol=3)
  j <- 1
  
  for (i in id) { 
    ## read data from file. be sure to include leading zeroes
    if (i<10) { 
      filename <- paste ("00",i,".csv",sep="")
    } else if (i<100) { 
      filename <- paste ("0",i,".csv",sep="")
    } else { 
      filename <- paste(i,".csv",sep="")
    }
    filepath <- paste(directory,filename,sep="/")
    filedata <- read.csv(filepath)
    
    ## assign value of specified column in file 
    vals <- filedata[,pollutant]
    
    ## determine number of good results that we're counting
    good <- !is.na(vals)
    numvals <- length(vals[good])
    
    #calculate mean for each file, store id, mean and number of results in matrix to recombine and recaulculate total mean
    sumvals <- sum(vals,na.rm=TRUE)
    m[j,] <- c(as.integer(i),sumvals,numvals)
    j <- j+1
  }
  
  ## now we have a matrix of sums, each with a number of values that calculated that sum. We need to recalculate a total mean from this.
  return(sum(m[,2])/sum(m[,3]))
}