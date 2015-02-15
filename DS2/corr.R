corr <- function(directory,threshold=0) { 
    list <- list.files(directory)
    len <- length(list)
    vals <- numeric() 
    i<- 1
    j<- 1
    while (i <= len) { 
        ## read each file
        filepath <- paste(directory,list[i],sep="/")
        filedata <- read.csv(filepath)
        com <- sum(complete.cases(filedata))
        if (com > threshold) { 
            gooddata <- filedata[complete.cases(filedata),]
            vals[j] <- cor(gooddata["nitrate"],gooddata["sulfate"])
            j<- j+1
        } 
        i <- i+1
    }
    return(as.numeric(vals))
}