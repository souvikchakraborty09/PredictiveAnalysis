# Perform the EDA for sepal and petal width for each species

#house data visualization
house<-read.csv("house.csv")
str(house)
library(dplyr)
house1<-house[,-1]
house1<- house %>% select(c(-1))
str(house1)

#***** GGPLOT2 GRAMMAR OF GRAPHICS ********#
# #
# COMPONENTS OF GRAMMAR OF GRAPHICS #
# 1. DATA : the dataset #
# 2. AESTHETICS : the metric onto which we plot data #
# 3. GEOMETRY : visual elements to plot the data #
# 4. FACET : groups by which we divide the data #
#***********************************************************#

library(ggplot2)
##Histograms
ggplot(data = house, aes(x=price))+geom_histogram()

# SCATTERPLOTS *
ggplot(data=iris, aes(y=Petal.Length,
                      x=Sepal.Length))+geom_point()
ggplot(data=iris, aes(y=Petal.Length,
                      x=Sepal.Length,col=Species))+geom_point()
ggplot(data=iris, aes(y=Petal.Length, x=Sepal.Length,
                      shape=Species))+geom_point()
ggplot(data=iris, aes(y=Petal.Length, x=Sepal.Length, col=Species,
                      shape=Species))+geom_point()
##Box Plots
ggplot(data = house,aes(x=factor(rooms),
                        y=price,fill=sewer))+geom_boxplot()
