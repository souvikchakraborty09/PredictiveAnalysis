#** BARPLOT *#
#to see distribution of continous variable we use histogram
#to see distribution of categorical variable we use barplot
#ggplot(data=iris, aes(y=Petal.Length,
# x=Species))+geom_bar()
ggplot(data=house, aes(x=waterfront))+geom_bar()

ggplot(data=house, aes(x=waterfront,
                       fill=air_cond))+geom_bar()
ggplot(data=house, aes(x=waterfront,
                       fill=air_cond))+geom_bar(position = "fill")
ggplot(data=house, aes(x=waterfront,
                       fill=sewer))+geom_bar(position="fill")

#** FREQUENCY-POLYGON ****#
# an alternative to a histogram used to see a distribution of continous #variable
ggplot(data=house, aes(x=price))+geom_freqpoly()
#increase variation
ggplot(data=house, aes(x=price))+geom_freqpoly(bins=50)
ggplot(data=house, aes(x=price))+geom_freqpoly(bins=100)
ggplot(data=house, aes(x=price,
                       col=air_cond))+geom_freqpoly(bins=60)

#hands on 1:-Do the analysis for toothgrowth dataset using freq. polygon chart.

#** BOXPLOTS *****#
# how does continous var change w.r.t. categorical var
#outliers are beyond the avg value
ggplot(data=house, aes(x=factor(rooms),
                       y=price))+geom_boxplot()
ggplot(data=house, aes(x=factor(rooms),
                       y=price, fill=factor(rooms)))+geom_boxplot()
ggplot(data=house, aes(x=factor(rooms),
                       y=price, fill=air_cond))+geom_boxplot()
ggplot(data=house, aes(x=factor(rooms),
                       y=price, fill=sewer))+geom_boxplot()