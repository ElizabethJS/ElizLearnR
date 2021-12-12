#-----------------------#
# CRIM 250 Final Project
# Due: 12/1/21
#-----------------------#

# SET UP #
library(dplyr)
library(plyr)
library(tidyverse)
library(ggplot2)

## setwd("C:/Users/Elizabeth/Desktop/CRIM 250/testGithub/ElizLearnR/Final Project")

# LOOKING AT THE DATA #
releases <- read.csv("pdp_state_releases.csv")
untouched.releases <- releases

dim(releases)
head(releases)

# CUSTODY AGENCY #
## create another column with numeric values for "PDP" and "STATE"
releases$custody_numeric <- 0
releases$custody_numeric[releases$custody_agency == "State"] <- 1

## histogram of custody agency using the numeric column to show where people are being released from
hist(releases$custody_numeric,
     main = "Histogram of Custody Agencies",
     ylab = "Custody Agency",
     xlab = "Frequency",
     breaks = seq(from=0, to=1, by=0.5))
# **might want to add legend where 1 = PDP, 2 = State
# **how do we get it to only be 1,2 on xlim (aka how do we get rid of the 1.2, 1.4, etc.)

# DATE OF RELEASE #
releases <- separate(releases,
                     col = "date_of_release",
                     into = c("date_of_releases","time"),
                     sep = " ")
unique(releases$time)
releases$time <- NULL
## getting rid of times - they're useless values 


# SEX #
## make a new column with binary gender
releases$gender_binary <- 0
releases$gender_binary[releases$sex == "Male"] <- 1

#add a histogram?

# AGE #
## histogram of ages
hist(releases$age,
     main = "Histogram of Ages",
     xlab = "Age",
     ylab = "Frequency",
     ylim = c(0, 5000),
     xlim = c(0,100))

# RACE ETHNICITY #
## shows the races recorded in this dataset
unique(releases$race_ethnicity)

## histogram of races
releases$race_numeric <- as.numeric(releases$race_ethnicity)
## what each of the numbers mean, based on the levels that R assigned to each race
# Asian: 1
# Black: 2
# Hispanic: 3
# Other: 4
# White: 5

hist(releases$race_numeric,
     main = "Histogram of Ages",
     xlab = "Age",
     ylab = "Frequency",
     ylim = c(0, 20000))
# **have to fix bin width
# **add legend

## make a new column with binary race
releases$race_eth_binary <- revalue(releases$race_ethnicity,c("White" = 0,
                                                               "Asian" = 1,
                                                               "Hispanic" = 1,
                                                               "Other" = 1,
                                                               "Black" = 1))


## regress custody numeric on race alone (non-white vs white)
ols.race <- lm(custody_numeric ~ race_eth_binary, data = releases)
summary(ols.race)


## regress custody numeric on race and gender
ols.race_gender <- lm(custody_numeric ~ race_eth_binary + gender_binary, 
                      data = releases)
summary(ols.race_gender)


## regress custody numeric on race, gender, and age
ols.demographics <- lm(custody_numeric ~ race_eth_binary + gender_binary + age, 
                                          data = releases)
summary(ols.demographics)

# Everything besides race yielded statistically significant estimates
