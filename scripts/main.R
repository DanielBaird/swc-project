# Title: R Basics
# Author: Daniel Baird daniel@danielbaird.com
#
# Date: 1 Oct 2015
# Version: 0.01

# get working directory
getwd()

# sets working directory, needs path
setwd('/Users/pvrdwb/swc/rstuff/data')

citation() # how to cite R in publications

234 / 2 / 3 * 12
log(1)
sqrt(16)
1 == 1 # boolean comparison
1 != 1

myvar <- 'hello' # left arrow <- is perferred for assignment
myvar = 'hello'  # equals works apparently

myrange <- 1:5  # now myrange is a list of numbers from 1 to 5
myrange^2  # returns a list as long as myrange, but each value is squared

ls()  # list defined variables
rm("myrange") # undefines myrange

rm(list = ls()) # undefines all yr vars

# Getting help
?functionname
help(functionname)

# quote the function name if it's a keyword
?"for"

example(functionname)  # awesome
apropos("keyword")  # also awesome
??(keyword)  # deep search through help topics
args(functionname)  # summarise arguments

# object types
# logicals, integers, doubles, complex, text
myint <- 1
type.of(myint)  # actually it's a double, lol

myint <- as.integer(1)
type.of(myint)  # yep got it this time

#
# data structures
#

# Vectors (one dimensional, single common type)

v <- vector(length=10) # gives a vector of ten FALSE values
v <- vector("integer", length=5) # five zeros
v <- vector("character", 10) # ten zero-length strings

seq(10) # sequence vector 1 to 10
1:10 # same thing
seq(1, 10) # same thing
seq(1, 10, by=3) # (1 4 7 10) note that it starts at 1
seq(0,10,by=3) # 0 3 6 9

weekdays <- c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat")
class(weekdays) # character
typeof(weekdays) # character
is.numeric(weekdays) # FALSE
is.vector(weekdays) # TRUE

length(weekdays) # 7
weekdays <- append(weekdays, 'oops')
length(weekdays) # 8

head(weekdays) 

#
# Factors
#
brothers <- factor(c('yes', 'yes', 'no'))
str(brothers)
levels(brothers)

continents <- factor(c('Westeros','Essos','Sothoros'))

#
# Matrix (always two-dimensional)
#
y <- matrix(1:16, 4)
colnames(y) <- LETTERS[1:4]

#
# Array (any-dimensional)
#

#
# List (one-dimensional, various types)
#
datatypes <- c('logical', 'integer', 'double', 'character', 'complex')
datastructures <- c('matrix', 'list', 'vector', 'factor')
mylist <- list(datatypes, datastructures)

# save everything
save(mylist, file='myvars.RData')
load('myvars.RData')

#
# Data Frames .. a collection of Lists, each with the same length and content types
# 

L1 <- letters[1:3]
print(L1)
num <- 1:30
print(num)
height <- rnorm(30, mean=1.8, sd=0.3)  # make a data set

df <- data.frame(id=num, height=height, cat=L1)
print(df)
# note that strings are by default converted to Factors
str(df)

barplot(df$height) # using $ to pick out a particular frame column
barplot(df$height, col=df$cat) # add colour selection

dfordered <- df[ order(df$cat), ] # ...um
print(dfordered)
barplot(dfordered$height, col=dfordered$cat)

# adding columns
df <- cbind(df, 6:1) # add a new column (with values ranging 6 down to 1)
df <- cbind(df, someCaps=LETTERS[6:1]) # add a column called someCaps

# adding rows
df <- rbind(df, list(31, 1.7, "a"))

# adding rows from other dataframes
df <- rbind(df, dfordered)
df <- rbind(df, na.omit(dfordered)) # na.omit will drop blank rows

# read in the data from gapminder sample
gapminder <- read.csv("gapminder-FiveYearData.csv")



