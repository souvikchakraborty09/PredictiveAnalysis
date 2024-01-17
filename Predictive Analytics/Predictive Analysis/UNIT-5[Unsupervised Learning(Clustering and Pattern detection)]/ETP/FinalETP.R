
df<-read.csv(file.choose(),stringsAsFactors = T)
View(df)

##Generate a random number that is 90% of the total number of rows in dataset.
ran<-sample(1:nrow(df), 0.9*nrow(df))
str(df)
range(df$HourlyRate)
range(df$MonthlyIncome)
range(df$MonthlyRate)
#View(df)
##the normalization function is created.
nor<-function(x){ (x-min(x))/(max(x)-min(x)) }


df_norm<-as.data.frame(lapply(df[,c(13,19,20)], nor))
summary(df_norm)
summary(df)

##extracting training set
df_train <- df_norm[ran,]
##extracting testing set
df_test <- df_norm[-ran,]

df_target_category<-df[ran,2]

df_test_category<-df[-ran,2]

#install.packages("class")
library(class)

#?knn

##run knn function
pr<-knn(df_train,df_test,cl=df_target_category,k=10)

##Create confusion matrix
tab <- table(pr,df_test_category)

##this function divides the correct predictions by total number of predictions
##that tells us how accurate the model is.
tab
accuracy<-function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)
