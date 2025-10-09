install.packages(deSolve)
library(deSolve)

#predator prey L-V

par(mfrow=c(1,2)) #this code means that each plot window will fit two plots

#parameter values
alpha <-1.1
beta <- 0.4
gamma <- 0.1
delta <- 0.4

yini <- c(X = 10, Y = 10) #these are the initial population sizes, i.e., both predators and prey start with 10 individuals

#this code constructs the model
Lot_Vol <- function (t, y, parms) {
  with(as.list(y), {
    dX <- alpha * X - beta * X * Y #prey equation
    dY <- 0.1 * X * Y - 0.4 * Y #predator equation
    list(c(dX, dY))
  }) }

times <- seq(from = 0, to = 100, by = 0.01) #this code sets the time interval population size will be sampled
out   <- ode(y = yini, times = times, func = Lot_Vol, parms = NULL) #this code runs the model

head(out) #here you can see the data frame created by the model

#the code below plots the data from the data frame
plot(y=out[, "X"], x = out[, "time"], type = 'l', col = "blue", xlab = "Time", ylab = "Animals (#)")
lines(y=out[, "Y"], x = out[, "time"], type = 'l', col = "red")
