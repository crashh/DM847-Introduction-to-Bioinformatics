# example R plot with ggplot2
# ggplot2 is availble on ubuntu from the apt-get package manager via the 
# package name "r-cran-ggplot2"
library(ggplot2) # "import" 

m = matrix(data=cbind(rnorm(30,0), rnorm(30,2), rnorm(30,5)), nrow=30, ncol=3)
	# create some random matrix

colnames(m) <- c('method1', 'method2', 'method3') 
	# set column header names for the matrix

df = as.data.frame(m) 
	# ggplot2 likes to have it's data as data frames

dfs = stack(df) 
	# "unrolls" the matrix such that the dataframe only contains tow columns

p = ggplot2(dfs, aes(x=values)) + geom_density(aes(group=ind,colour=ind,fill=ind),alpha=0.3)
	# creates the actual plot with some colours and transparity and stores it

ggsave("~/test.png", plot=p, height=11, width=10)
	# saves the plot with the height and width IN INCHES

