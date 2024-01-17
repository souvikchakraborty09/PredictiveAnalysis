##preprocessing for sales data
df<-read.csv("salesDatafor preprocessing.csv")
df<-read.csv(file.choose(),header = TRUE, stringsAsFactors = TRUE)
str(df)
summary(df)
View(df)
##Variables "Order.Priority","Sales","Ship.Mode","Profit","Unit.Price" and
##Customer.Name have missing data.

##Delete all rows with missing data and name the new dataset "s1"
s1<-na.omit(df)
View(s1)
summary(s1)

##Replace the missing values with the mean value of each variable.
df$Sales[is.na(df$Sales)]<-mean(df$Sales,na.rm = TRUE)
df$Profit[is.na(df$Profit)]<-mean(df$Profit,na.rm = TRUE)
df$Unit.Price[is.na(df$Unit.Price)]<-mean(df$Unit.Price,na.rm = TRUE)
summary(df)
nrow(df)

##Replace the missing values with random value between min and max values of each variable
##we use runif() function.
df$Sales[is.na(df$Sales)]<-runif(n=sum(is.na(df$Sales)),
                                 min = min(df$Sales, na.rm = TRUE),
                                 max = max(df$Sales, na.rm = TRUE))
summary(df)

#Missing Values for variables "Order priority","Ship.mode","Customer.Name"
#cannot be replaced by the mean values, because these variables are categorical.
#Since categorical variables do not have min and max values, we can replace the
#missing values for categorical variables by random value from each variable

df$Order.Priority[is.na(df$Order.Priority)] <- sample(levels(df$Order.Priority),
                                                      size = sum(is.na(df$Order.Priority)),
                                                      replace = TRUE)
summary(df)
