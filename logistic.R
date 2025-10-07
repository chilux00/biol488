# Load necessary libraries
library(tidyverse)
library(ggplot2)
library(cowplot)
library(forcats)
library(dplyr)
set.seed(1234)

# import data file
data <- read.csv("data/logistic.csv")

data_plot <- data %>%
  ggplot(aes(x = t,
             y = Nt.1)) +
  geom_point() +
  xlab("Time") +
  ylab("Nt+1") +
  labs(title = "Logistic Growth Simulation")

data_plot
data
