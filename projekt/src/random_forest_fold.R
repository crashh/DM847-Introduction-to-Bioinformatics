#!/usr/local/bin/Rscript
args <- commandArgs(TRUE)

# Check if required packages are installed, if not try to install them
if(require("randomForest")){
    print("randomForest is loaded correctly")
} else {
    print("trying to install randomForest")
    install.packages("randomForest", repos="http://cran.rstudio.com/")
    if(require("randomForest")){
        print("randomForest installed and loaded")
    } else {
        stop("could not install randomForest")
    }
}

if(require("cvTools")){
    print("cvTools is loaded correctly")
} else {
    print("trying to install cvTools")
    install.packages("cvTools", repos="http://cran.rstudio.com/")
    if(require("cvTools")){
        print("cvTools installed and loaded")
    } else {
        stop("could not install cvTools")
    }
}

K = as.numeric(args[1])
dir <- args[2]
file_labelled <- args[3]
file_unlabelled <- args[4]
file_unlabelled_predictions <- args[5]

#TODO: Add support for both labelled file in and unlabelled file in, also output path file

setwd(dir)
breath <- read.csv(file_labelled, header = TRUE, sep = "\t")
breath <- breath[,-1]

set.seed(12345)

folds <- cvFolds(nrow(breath), K = K)
test <- list()

#for each
for (i in 1:K){
  test_index <- folds$subset[ seq(i, length(folds$subset), K),]
  data_index <- folds$subset[-seq(i, length(folds$subset), K),]
  breath.rf <- randomForest(class ~ ., data=breath, subset=data_index, importance=TRUE, proximity=TRUE, keep.forest=TRUE, 
                          xtest=breath[test_index, names(breath)!='class'], ytest=breath[test_index,'class'])
  test[[i]] <- breath.rf
}

sensi <- 0
spec  <- 0
acur  <- 0
for (i in 1:K){
  acur  <- acur  + (test[[i]]$test$confusion[1, 1] + test[[i]]$test$confusion[1, 1])/
                    (test[[i]]$test$confusion[1, 1] + test[[i]]$test$confusion[1, 2] + test[[i]]$test$confusion[2, 2]+test[[i]]$test$confusion[2, 1])
  if(test[[i]]$test$confusion[1, 1]+test[[i]]$test$confusion[2, 1] == 0){
    sensi <- sensi +1
  }else{
    sensi <- sensi + test[[i]]$test$confusion[1, 1]/(test[[i]]$test$confusion[1, 1]+test[[i]]$test$confusion[2, 1])
  }
  if(test[[i]]$test$confusion[2, 2]+test[[i]]$test$confusion[1, 2] == 0){
    spec  <- spec  + 1
  }else{
    spec  <- spec  + test[[i]]$test$confusion[2, 2]/(test[[i]]$test$confusion[2, 2]+test[[i]]$test$confusion[1, 2])

  }
}
acur <- acur/K
sensi <-sensi/K
spec <-spec/K
mostdescri <- head(sort(breath.rf$importance[,4], decreasing=T), n=5)

datadescri <- as.vector(names(mostdescri))
datadescri <- c(datadescri, 'class')
newlist = breath[,datadescri]

for (i in 1:K){
test_index <- folds$subset[ seq(i, length(folds$subset), K),]
data_index <- folds$subset[-seq(i, length(folds$subset), K),]
datadescri.rf <- randomForest(class ~ ., data=newlist, subset=data_index, importance=TRUE, proximity=TRUE, keep.forest=TRUE, 
             xtest=newlist[test_index, names(newlist)!='class'], ytest=newlist[test_index,'class'])
}
print("Mean Acuracy")
print(acur)
print("Sensitivity")
print(sensi)
print("Specificity")
print(spec)
print("5 most discriminating features using Gini index")
print(mostdescri)
print("Decision tree")
print(getTree(datadescri.rf, k=42, labelVar = T))

unlabelled <- read.csv(file_unlabelled, header = TRUE, sep = "\t")
unlabelled_files <- unlabelled[,1]
unlabelled <- unlabelled[,-1]
p <- predict(datadescri.rf, newdata = unlabelled, type="class")
predictions <- c('file', as.character(unlabelled_files))
predictions <- cbind(predictions, c('candy', as.character(p)))
predictions
write.table(predictions, row.names=F, col.names=F, quote=F, sep = '\t', file=file_unlabelled_predictions)
