
gdp <- function(data, selected_year=NULL) {

  if (!is.null(selected_year)) {
    data <- subset(data, year == selected_year)
  }
  
  # assume data has pop and gdpPercap
  gdp = data$pop * data$gdpPercap
  
  ##return(gdp)
  # alternatively, bind the gdp column on
  return (cbind(data, gdp=gdp))
}



# generically read a table in...
gm <- read.table('../data/gapminder-FiveYearData.csv',
                 header=TRUE, sep="," )

answer = gdp(gm)
answer
answer = gdp(gm, 1957)
answer
