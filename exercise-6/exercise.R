# Exercise 6: DPLYR join introduction

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)


# Create a dataframe of the average arrival delay for each destination, then use left_join
# to join on the "airports" dataframe, which has the airport info

View(flights)
View(airports)

# group by dest and summarize each dest's delay in arrival
# change column name
x <- flights %>% 
  group_by(dest) %>% 
  summarize(avg_delay = mean(arr_delay, na.rm = T)) %>% 
  rename(faa = dest) %>% 
  left_join(airports, by = 'faa')

View(x)

# Create a dataframe of the average arrival delay for each airline, then use left_join
# to join on the "airlines" dataframe, which has the airline info

y <- flights %>% 
  group_by(carrier) %>%
  summarize(avg_delay = mean(arr_delay, na.rm = T)) %>% 
  left_join(airlines, by = 'carrier') 

View(y)

### Bonus ###
# Calculate the average delay by city AND airline, then merge on the city and airline information


# If you're running into sorting issues:
# http://stackoverflow.com/questions/26555297/dplyr-arrange-a-grouped-df-by-group-variable-not-working