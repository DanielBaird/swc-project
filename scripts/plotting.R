
## plotting stuff

# list installed packages
installed.packages()

# install a package
install.packages('ggplot2')

# invoke a package
library(ggplot2)

# a function to inspect a data.frame
explore <- function(df) {
  
  # check dimensions, show names, summarise
  print(dim(df))
  print(names(df))
  print(summary(df))
  print(str(df))
}

#
# now actually do some plotting
#
# aes does "aesthetic" cuntomisations, e.g. allocating the x and y axes
ggplot(data=gm, aes(x=lifeExp, y=gdpPercap)) + geom_point()

# now add colour
ggplot(data=gm, aes(x=lifeExp, y=gdpPercap, color=continent)) + geom_point()

# now add a title
ggplot(data=gm, aes(x=lifeExp, y=gdpPercap, color=continent)) + geom_point() + ggtitle("Life expectancy vs GDP oer capita")
  
# save by running ggsave()...
ggsave(file="plot.png")


#
# okay there's this odd thing about "devices".  There's a default device all your
# graphs go to.  You can start a new device with functions like pdf(...).  Then
# your graphs all get rendered to a PDF format.  Remember to dev.off() when you're
# done so all the (cached) plots get written to the file.
#
pdf(file="plots/plot.pdf") # get ready to put stuff in this pdf
# could use png(file="...") to make a big ol' png

ggplot(data=gm, aes(x=lifeExp, y=gdpPercap)) + geom_point()
ggplot(data=gm, aes(x=lifeExp, y=gdpPercap, color=continent)) + geom_point() + ggtitle("Life expectancy vs GDP oer capita")

dev.off() # write everything up to here into that pdf we mentioned earlier


#
# multi figure plot
#
pdf(file="plots/continents.pdf")
ggplot(data=gm, aes(x=year, y=lifeExp, color=country)) + 
  geom_point(aes(color=continent)) +
  facet_grid(continent ~ .) 
  # in facet_grid, the tilda is a separator, and the dot means "no faceting".
  # So " ~ . continents " means no vertical faceting, and horizontally facet by continent. 
dev.off()









