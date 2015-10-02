# Title: R - subsetting
# Author: Daniel Baird daniel@danielbaird.com
#
# Date: 1 Oct 2015
# Version: 0.01

# make a vector
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
summary(x)

# getting elements from a vector
x[1]
x[1:3]
x[c(1, 2, 3)] # same as x[1:3]
x[c(1,1,1)] # same item multiple times

x[6] # returns a NA
x[-1] # skip the first one
x[-2] # skip the second one (returns x[1], x[3], x[4], x[5])
x[-2:-3] # skip the sequence from 2 to 3

names(x) <- letters[1:5]

# various ways to print:
#
#     b   c   d 
#   6.2 7.1 4.8
#
x[2:4]
x[c(-1,-5)]
x[c(2,3,4)]
x[c(2:4)]

names(x) == 'b'  # returns a vector of answers, one for each element of x
x[names(x) == 'b'] # subsets x where condition is true

which(names(x) == 'b') # returns the indexes of x for which condition is true

x[which(names(x) == 'b')] # subsets x where condition is true
x[-which(names(x) == 'b')] # reverse subset of x (where condition is NOT true)

# can use %in% instead of == for a string match
#  |  &  ==  !=  all work as expected
m <-matrix(rnorm(24), ncol=4, nrow=6)
m
class(m)

m[1]
m[1,]
m[1,2]
m[,2]

#
# list subsetting
#

xlist <- list(a="SwC", b=1:10, data=head(gm$gdpPercap))
str(xlist)
xlist
xlist[1]
xlist$a
xlist[[1]]

class( xlist      )
class( xlist[1]   )
class( xlist$a    )
class( xlist[[1]] )

names(gm)
head(gm[3])
head(gm["pop"])
head(gm$pop)

#
# using which
#
which(gm$year == 1957)  # gives row indexes where the year is 1957
obs = gm[which(gm$year == 1957),]  # subset of rows that are from 1957
obs_which
dim(obs_which)

#
# same thing using subset
#
obs_sub = subset(gm, year == 1957)
obs_sub
dim(obs_sub)

?as.data.frame




