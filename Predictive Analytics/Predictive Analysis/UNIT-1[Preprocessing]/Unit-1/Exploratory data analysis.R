##Get and print current working directory
print(getwd())

#import dataset
setwd("C:/Users/91825/OneDrive/Desktop/R Programming/Predictive Analysis/sales dataset")
data<-read.csv("sales dataset.csv")
View(data)
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))
str(data)
##convert itemcode datatype(char) into factor.
data$Item.code<-as.factor(data$Item.code)
str(data)
View(data)
##Get the max sale amount
sale<-max(data$Sales_Amt)
print(sale)
##Get all the details those having max sales.
retval<-subset(data, Sales_Amt==max(Sales_Amt))
View(retval)
##fetch the details for finance department who have sales amount greater than 1000
info<-subset(data,data$Sales_Amt>1000 & 
                 data$Department=="Finance")
View(info)

newdata<-subset(data,data$Sales_Amt>1000&
                    data$Department=="Finance",
                select=c('Employee.Name','Employee.Country'))
View(newdata)
##fetch all the details after 1 Jan 2014.
##default format is "%Y-%m-%d"
retval<-subset(data,as.Date(data$Sales.Date,"%d-%m-%Y") > 
                   as.Date("01-01-2014","%d-%m-%Y"))
View(retval)
##We need to import daimonds dataset(Built-in dataset)
##To get the knowledge of any particular datasets about which we don't have any idea.(e.g-diamond)
#1.?diamond
#2.data (diamond)
??diamond
??painter
##We needed reading skills dataset for which we installed the package inside which the reading skills dataset was present.
??ReadingSkills
install.packages("party")

##To identify the NA
is.na(data)
install.packages("tidyverse")
library(ggplot2)
##To identify the outliers.(We need to use)
ggplot(data=data,aes(x=data$Item.Category,
                     y=data$Sales_Cost))+geom_boxplot()

       