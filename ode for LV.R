#install.packages(deSolve)
library(deSolve)

#predator prey L-V
#this code means that each plot window will fit two plots

par(mfrow=c(1,2)) 

#parameter values
alpha <-12
beta <- 0.6
gamma <- 0.3
delta <- 0.5

#these are the initial population sizes, 
#i.e., both predators and prey start with 10 individuals
yini <- c(X = 10, Y = 10) 

#this code constructs the model
Lot_Vol <- function (t, y, parms) {
  with(as.list(y), {
    dX <- alpha * X - beta * X * Y #prey equation
    dY <- 0.1 * X * Y - 0.4 * Y #predator equation
    list(c(dX, dY))
  }) }

#this code sets the time interval population size will be sampled
times <- seq(from = 0, 
             to = 100, 
             by = 0.01) 
out <- ode(y = yini, 
           times = times, 
           func = Lot_Vol, 
           parms = NULL) #this code runs the model

head(out) #here you can see the data frame created by the model

#the code below plots the data from the data frame
plot(y=out[, "X"], 
     x = out[, "time"], 
     type = 'l', 
     col = "blue", 
     xlab = "Time", 
     ylab = "Animals (#)")
lines(y=out[, "Y"], 
      x = out[, "time"], 
      type = 'l', 
      col = "red")
