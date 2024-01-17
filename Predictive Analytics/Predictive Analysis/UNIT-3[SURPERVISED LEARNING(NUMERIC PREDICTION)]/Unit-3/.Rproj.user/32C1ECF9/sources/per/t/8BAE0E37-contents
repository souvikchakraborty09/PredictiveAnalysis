install.packages("corrplot")
library(corrplot)
library(ggplot2)
data1<-swiss
View(swiss)
ggplot(data1, aes(x=Fertility, y=Infant.Mortality))+geom_point()+
    geom_smooth(method="lm",se=TRUE,color="black")

#few attributes(2)
my_data<-data1[,c(1,6)]
##all attributes(1)
cor_mat=cor(data1)
##few attributes(2)
cor_mat=cor(my_data)
##all_attributes(1)
Tes<-cor.test(swiss$Fertility,swiss$Infant.Mortality,method = "pearson")
Tes
corrplot(cor_mat, method = "circle")
