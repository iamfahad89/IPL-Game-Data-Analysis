#IPL Data Set Pre-Processing Steps
#---------------------------------------

#Install or load packages
library(tidyverse)
library(psych)
install.packages("skimr")
library(skimr)
install.packages("ISLR")
library(ISLR)
library(readxl)

#read excel IPL data set
ipl_original <- read_excel("ipl_original.xlsx")
View(ipl_original)


str(ipl_original)

#read the starting few lines of data
head(ipl_original)
head(ipl_original,10)

#read the ending few lines of data
tail(ipl_original)
tail(ipl_original,10)

#to know the structure of your data set
glimpse(ipl_original)
summary(ipl_original)
describe(ipl_original)
skim(ipl_original)

#remove the dupicate values from the selected columns
ipl_deduped <- ipl_original[!duplicated(ipl_original[c("Team1","Team2","match_date","Season_Year","Season_Winner","Venue_Name","City_Name","Country_Name","Toss_Winner","match_winner")]),]
#no duplicates found

#reducing the number of dimensions(Redundant/irrelevant attributes eliminated)
library(dplyr)
ipl_deduped <- select(ipl_deduped, -1:-2, -13:-18)

#to export the dataframe to .csv file
write.csv(ipl_deduped, "ipl_cleaned.csv")

#manually fixed venues for home team in "ipl_cleaned.csv"
#to fix missing values in other columns from file "ipl_cleaned.csv"

#loaded the file "covid19_cleaned.csv"
ipl_cleaned <- read.csv(file.choose(), header = T,stringsAsFactors = FALSE)
str(ipl_cleaned)
summary(ipl_cleaned)

#replacing the NA in Venue_Home_Team column with "Royal Challengers Bangalore"
ipl_cleaned$Venue_Home_Team[which(is.na(ipl_cleaned$Venue_Home_Team))] <- "Royal Challengers Bangalore"

#replacing the NA in Toss_Winner column with "No Result"
ipl_cleaned$Toss_Winner[which(is.na(ipl_cleaned$Toss_Winner))] <- "No Result"

#to export the dataframe to .csv file
write.csv(ipl_cleaned, "ipl_cleaned.csv")

#read "ipl_cleaned.csv"
ipl_cleaned <- read.csv("ipl_cleaned.csv")

summary(ipl_cleaned)

#omit the 3 rows with na's(missing data)
ipl_cleaned <- na.omit(ipl_cleaned)
#now 634 observations remaining

#save the dataframe to .csv file
write.csv(ipl_cleaned, "ipl_cleaned.csv")

#creating a random samples subset for analysis purpose
#ideal sample size taken as 10% of the population(approximately)
#However in this case same size of 64 would be very small to identify precise differences,
#therefore we have taken a sample size of 100 for our analysis

install.packages("dplyr")
library(dplyr)

ipl_sample <- sample_n(ipl_cleaned, 100)
ipl_sample <- select(ipl_sample, -1)

#writing or saving the sampled dataframe to a csv file
write.csv(ipl_sample, "ipl_sample.csv")
