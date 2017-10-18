

# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library('fueleconomy')

# Install (if you haven't already) and load the `dplyr`package
install.package('dplyr')
library('dplyr')

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
cars.1997 <- filter(vehicles, year == 1997)
View(cars.1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(cars.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.20.miles <- filter(vehicles, cty > 20, drive == '2-Wheel Drive')
View(two.wheel.20.miles)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?

two.wheel.20.miles$id[min(two.wheel.20.miles$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MaxHwy <- function(my.year, my.make) {
  filter(vehicles, year == my.year, make == my.make) %>% 
    filter(hwy == min(hwy)) %>% 
    return()
}

warnings()

# What was the most efficient honda model of 1995?
MaxHwy(1995, "Honda")

