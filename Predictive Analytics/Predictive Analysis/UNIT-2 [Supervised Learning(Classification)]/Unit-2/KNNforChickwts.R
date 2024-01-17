??chickwts
cw<-ChickWeight
View(cw)
str(cw)
summary(cw)
head(cw)
##Generate a random sample that is 90% of the dataset.
ran <- sample(1:nrow(cw), 0.9*nrow(cw))
##Create a normalization function
nor<-function(x){ ((x-min(x))/(max(x)-min(x))) }
##Run normalization on 1st column  and 2nd column as they are predicators and column 3 and column 4 is a categorical column.
cw_norm <- as.data.frame(lapply(cw[,c(1,2)],nor))
##extracting_train_Set
cw_train <- cw_norm[ran,]
##extracting_test_Set
cw_test <- cw_norm[-ran,]
##extract 3th column of train dataset because it will be used as 'cl' argument in
##function.
cw_target_category<-cw[ran,c(3,4)]
##extract 5th column if test dataset to measure the accuracy
cw_test_category<-cw[-ran,c(3,4)]
install.packages("class")
library(class)

?knn

##run knn function
pr<-knn( cw_train,cw_test,cl=cw_target_category,k=24)

##Create confusion matrix
tab <- table(pr,cw_test_category)

##this function divides the correct predictions by total number of predictions
##that tells us how accurate the model is.
tab
accuracy<-function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)
