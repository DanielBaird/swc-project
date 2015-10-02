# Title: R - functions
# Author: Daniel Baird daniel@danielbaird.com
#
# Date: 1 Oct 2015
# Version: 0.01

# make a function that receives a numeric and adds 1 to it

add_one <- function(input) {
  return (input + 1)
}

test <- function(input) {
  return (function() { 
    print(input)
    print(input)
  })
}

go1 <- test("dynamic")
go2 <- test("function")
go3 <- test("definition")

go1()
go2()
go3()