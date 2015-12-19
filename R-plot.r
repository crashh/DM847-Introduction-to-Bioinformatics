library(ggplot2)
library(reshape2)

args <- commandArgs(TRUE)
setwd(args[1])

rawCsv = read.csv(file = args[2], comment.char = "#", header = TRUE)

# Removes columns we don't need
rawCsv <- rawCsv[-(1:1), -(2:2)]

# Re-formats the data, such that we may plot it
processedData <- melt(rawCsv)

# Setup the column names
colnames(processedData) = c("y", "x", "z")

# Removes the X in the variable name, such that it may be interpreted as a 
# numeric value
processedData <- as.data.frame(sapply(processedData, gsub, pattern="X", 
    replacement=""))

# Convert data to their numeric values
processedData$x <- as.numeric(as.character(processedData$x))
processedData$y <- as.numeric(as.character(processedData$y))
processedData$z <- as.numeric(as.character(processedData$z))

c <- ggplot(processedData, 
        aes(y = processedData$x, x = processedData$y, color = processedData$z)) + 
        geom_tile() +
        scale_color_gradient2(low = "yellow", mid = "blue", high = "red", midpoint = -650)

ggsave(plot = c, filename = args[3])
