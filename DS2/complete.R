complete <- function(directory = "specdata", id = 1:332) { 
    ## return a mean value of a specified measure from a directory full of csv files
    
    ## check for proper range identification
    if (max(id) > 332) { 
        return("Sorry, there are only 332 weather stations providing data. please change your range")
    }
    
    ## build a data table of values from the specified range. 
    m <- data.frame (id = id,nobs=0)
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
        
        ## find the number of complete cases
        numcomplete <- sum(complete.cases(filedata))
        
        ## store values in matrix
        m[j,] <- c(as.integer(i),as.integer(numcomplete))
        j <- j+1
    }
    
    return(m)
}