library(ggplot2)
library(reshape2)

args <- commandArgs(TRUE)
setwd(args[1])
data = read.csv(file = args[2], comment.char = "#", header = TRUE)

# Remove the first two rows and columns from data
data <- data[-(1:1),-(2:2)]
# Reshaping the data into a "long" format from a wide format so it can be plotted
data1 <- melt(data)
colnames(data1) = c("y","x","z")
data1 <- as.data.frame(sapply(data1,gsub,pattern="X", replacement=""))
data1$x <- as.numeric(as.character(data1$x))
data1$y <- as.numeric(as.character(data1$y))
data1$z <- as.numeric(as.character(data1$z))

#####
c <- ggplot(data1, aes(y = data1$x, x = data1$y, color = data1$z)) + geom_tile() + scale_color_gradient2(low = "yellow", mid = "blue", high = "red", midpoint = -650)
ggsave(plot=c, filename=args[3])
