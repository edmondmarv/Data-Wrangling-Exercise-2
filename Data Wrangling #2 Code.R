# Load dplyr and tidyr packages

library(dplyr)
library(tidyr)

# Load Titanic dataset

library(readr)

titanic_original <- read_csv("~/School/Springboard/Exercises/Data Wrangling #2/titanic_original.csv")

View(titanic_original)

# Move dataset into a dataframe

titanic_original_df <- tbl_df(titanic_original)


# Correct "Port of Embarkation" values

titanic_original_df[, 11][is.na(titanic_original_df[, 11])] <- "S"

View(titanic_original_df)


# Fill in missing age values with column mean

titanic_original_df[, 5][is.na(titanic_original_df[, 5])] <- mean(titanic_original_df[, 5], na.rm=TRUE)

titanic_original_df$age[is.na(titanic_original_df$age)] <- mean(titanic_original_df$age, na.rm=TRUE)

View(titanic_original_df)


# Fill in missing lifeboat values with string "NA"

titanic_original_df$boat[is.na(titanic_original_df$boat)] <- "NA"

View(titanic_original_df)


# Create binary variable for missing cabin number

hcn <- !is.na(titanic_original_df$cabin)
hcn

hcn <- as.numeric(!is.na(titanic_original_df$cabin))
hcn

titanic_original_df$has_cabin_number <- as.numeric(!is.na(titanic_original_df$cabin))

View(titanic_original_df)

