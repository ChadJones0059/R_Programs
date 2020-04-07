##### Build an R data frame that contains all of the data.  
##### Note you will have to create each column as a vector first 
##### and then put them into a dataframe.  The following columns are 
#### needed:  Repoxodin or not, Gender, Subject Number, Time1, Time2, Time3 
#### and Time4.  Be sure to have clear column labels for each variable 


###### VERY CONFUSED ON THE WHOLE REPOXODIN QUESTIONS? ISN'T THIS ABOUT KEFLEXODIN? 

a1 <- c( "K", "K", "K", "K", "K", "K", "C", "C", "C", "C", "K", "K", "K", "K", "K", "K", "K", "C", "C", "C", "C")

a2 <- c( "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M")

a3 <- c(4, 14, 18, 22, 26, 34, 40, 49, 58, 41, 63, 73, 80, 85, 95, 98, 99, 105, 114, 119, 128)

a4 <- c(16.5, 14.8, 15.1, 14.2, 16.0, 13.3, 11.8, 14.8, 15.4, 12.2, 14.3, 11.2, 13.0, 16.0, 14.7, 15.3, 14.2, 16.4, 16.2, 16.0, 13.5) 

a5 <- c(15.3, 12.2, 12.6, 16.4, 17.4, 15.1, 11.1, 12.7, 11.6, 18.0, 14.8, 15.9, 16.9, 15.9, 16.5, 13.8, 18.1, 11.0, 14.4, 16.7, 14.5)

a6 <- c(14.3, 17.8, 12.3, 18.3, 18.5, 15.2, 15.8, 14.9, 13.7, 15.8, 15.8, 19.9, 14.9, 16.0, 12.9, 15.2, 12.2, 15.1, 15.8, 14.1, 11.9)

a7 <- c(13.8, 15.7, 13.0, 8.7, 7.6, 7.4, 11.0, 13.9, 7.6, 8.9, 8.0, 6.8, 5.8, 10.5, 9.9, 11.3, 10.3, 12.2, 13.8, 8.3, 12.7)

Keflex <- a1
Gender <- a2
Sub_Num <- a3
Time1 <- a4
Time2 <- a5
Time3 <- a6
Time4 <-a7

data1 <- data.frame(Keflex, Gender, Sub_Num, Time1, Time2, Time3, Time4)

colnames(data1) <- c("Repoxodin or not?", "Gender", "Subject Number", "Time 1", "Time 2", "Time 3", "Time 4")


## Create two subsets of the data one for Repoxodin or not (using the subsetting logic)
##### I don't understand the repoxodin part?

## 'Repo' contains subjects on Keflexodin
repo <- subset(data1, Keflex == "K")
## 'control' contains subjects not on Keflexodin
control <- subset(data1, Keflex == "C")


## Create two subsets of the data one for Male and one for Female using the subsetting logic 

male <- subset(data1, Gender == "M")

female <- subset(data1, Gender == "F")

## Find summaries for each of the five datasets

repo_sum <- summary(repo)
control_sum <- summary(control)
male_sum <- summary(male)
female_sum <- summary(female)
full_sum <- summary(data1)

## Create a new data frame that has the summaries for each of the 5 datasets

summary_all <- data.frame(full_sum, repo_sum, control_sum, male_sum, female_sum)

## Export the data frame containing the summaries into an Excel (.xlsx) format

## call the 'Rio' library to get export to work

library(rio)

export(summary_all, file = "summary_Repoxodin.xlsx")

