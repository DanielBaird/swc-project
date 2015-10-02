#!/usr/bin/env Rscript

# Title: plots of continent data
# Author: Daniel Baird daniel@danielbaird.com
#
# Date: 2 Oct 2015
# Version: 0.02

# TODO: make sure ggplot2 is installed

# now we've definitely got it, get ggplot2
library(ggplot2)

# TODO: make sure there's a data/gapminder.RData
load('data/gm.rdata')
# now there's a gm variable in scope

draw_dots_continent <- function(df) {
  # whip up a sweet plot
  plot <- ggplot(data=df, aes(x=year, y=lifeExp, color=country)) + 
    geom_point(aes(color=continent)) +
    facet_grid(. ~ continent)
  # draw it
  print(plot)
}

png_plot <- function(name) {
  png(file=paste(name, 'png', sep='.'))
  draw_dots_continent(gm)
  dev.off()
}

# now the script handling stuff
arg <- commandArgs(TRUE)
try(png_plot(arg[1]))

