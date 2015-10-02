# Title: R Reading stuff in
# Author: Daniel Baird daniel@danielbaird.com
#
# Date: 1 Oct 2015
# Version: 0.01

# read from a csv
gapminder <- read.csv('../data/gapminder-FiveYearData.csv')

# generically read a table in...
gm <- read.table('../data/gapminder-FiveYearData.csv',
                 header=TRUE, sep="," )

save(gm, file = "gm.rdata")

rm(list=ls())
load("gm.rdata")
names(gm) # check the column names

aus <- subset(gm, country == 'Australia')

# subset by row number
aus <- gm[61:72,]

# subset with selected columns
aus <-  gm[61:72,2:3]

# subset by column names etc
aus <- subset(gm, country == 'Australia', select=c('pop', 'year'))

# histogram
hist(gm$lifeExp)

# plot population for each year
boxplot(pop~year, data=gm)

# add labels
boxplot(pop~year, data=aus, main='Population growth', xlab='years', ylab='Population')

# actually see the box plots..
boxplot(lifeExp~year, data=gm, main="Life Expectancy", xlab="Year", ylab="Age")
