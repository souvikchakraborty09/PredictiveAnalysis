?? airquality

dataset <- airquality
View(dataset)

summary(dataset)
# df$Unit.Price[is.na(df$Unit.Price)]<-mean(df$Unit.Price,na.rm = TRUE)
dataset$Ozone[is.na(dataset$Ozone)] <- mean(dataset$Ozone,na.rm = TRUE)
dataset$Solar.R[is.na(dataset$Solar.R)] <- mean(dataset$Solar.R,na.rm = TRUE)
summary(dataset)
##Outliers
boxplot(dataset$Ozone, main ="Ozone")
boxplot(dataset$Solar.R, main ="Solar")
boxplot(dataset$Wind, main ="Wind")
boxplot(dataset$Temp, main ="Temp")
boxplot(dataset$Month, main ="Month")
boxplot(dataset$Day, main ="Day")
## Ozone and Wind column is having outliers.

