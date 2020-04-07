### A researcher conducting a multi-site study is interested in impulsiveness in individuals who use Cocaine.  This study is conducted at five sites across the country.  
### All participants in the study were given a urine test to determine whether or not they were cocaine users.  The subjects' gender and age were recorded as well.  
### Three treatments were given to the participants (at random) as well as general cognitive therapy for impulsive behavior.  All participants receive the cognitive therapy.  
### The file Impusivity.xls (attached) has the data set in it. Note that the data are recorded on different sheets of the excel document.  She requests the following:

#### The data is stored on the researcher's computer in the directory "C:\TempData".
### Your code should read in the data from this directory

###set a working directory
#setwd("C:/TempData/")
setwd("C:/Users/Jones/Desktop/VCU/Spring2020/STAT 321")
getwd()

###upload spreadsheet "Impulsivity.xlsx" from directory###

library(openxlsx)

library(rio)

impulsivity <- lapply(1:5, function(i) read.xlsx("Impulsivity.xlsx", sheet = i))

#### Check to see if data imported correctly 
head(impulsivity)

#### make 5 dataframes from each excel sheet

Site1 <-impulsivity[[1]]
Site2 <-impulsivity[[2]]
Site3 <-impulsivity[[3]]
Site4 <-impulsivity[[4]]
Site5 <-impulsivity[[5]]

### Make new columns for each dataframe

Site1$Site_Num <- 1
Site2$Site_Num <- 2
Site3$Site_Num <- 3
Site4$Site_Num <- 4
Site5$Site_Num <- 5

### Now Append All the Data.frames into one 

impulsivity_stack <- rbind(Site1,Site2,Site3,Site4,Site5)


#####	Histograms of Age across treatments ###

hist(impulsivity_stack$Age[impulsivity_stack$TRT == "C"], main = "Age of Subjects
     in Treatment C ", xlab = "Age")

hist(impulsivity_stack$Age[impulsivity_stack$TRT == "L"], main = "Age of Subjects
     in Treatment L", xlab = "Age")

hist(impulsivity_stack$Age[impulsivity_stack$TRT == "N"], main = "Age of Subjects
     in Treatment N", xlab = "Age")

####### Histograms of Age for different gender ###

hist(impulsivity_stack$Age[impulsivity_stack$Gender == "F"],
     main = "Age of Female Subjects", xlab = "Age")

hist(impulsivity_stack$Age[impulsivity_stack$Gender == "M"],
     main = "Age of Male Subjects", xlab = "Age")

####Box plots of Impulsivity for each visit time ####

boxplot(impulsivity_stack$Imp1,impulsivity_stack$Imp2,impulsivity_stack$Imp3,
        impulsivity_stack$Imp4,impulsivity_stack$Imp5, 
        main = "Impulsivity Times for Each Trial", 
        horizontal = TRUE,
        xlab = "Impulsivity Time (seconds)",
        names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5"))
 
#### Interpretation of Boxplots #####

# Trial 1: 
# Shape: symmetrical 
# Center: median around 72 sec
# Spread: 65 sec to 76 sec
# Unusual Features: outlier around 79

# Trial 2: 
# Shape: skewed left 
# Center: median around 67 sec
# Spread: 61 sec to 76 sec
# Unusual Features: outliers at 59 sec and 77 sec

# Trial 3: 
# Shape: skewed left 
# Center: median around 65 sec
# Spread: 58 sec to 74 sec
# Unusual Features: outlier at 56 sec

# Trial 4: 
# Shape: symmetrical
# Center: median around 65 sec
# Spread: 57 sec to 73 sec
# Unusual Features: none

# Trial 5: 
# Shape: skewed right
# Center: median around 61 sec
# Spread: 52 sec to 73 sec
# Unusual Features: outlier at 73 sec

######## Box plots of Impulsivity across treatments ####

### create datasets for each treatment

treatment_c <-impulsivity_stack[impulsivity_stack$TRT == "C", 1:11]
treatment_l <-impulsivity_stack[impulsivity_stack$TRT == "L", 1:11]
treatment_n <-impulsivity_stack[impulsivity_stack$TRT == "N", 1:11]

boxplot(treatment_c$Imp1, treatment_c$Imp2, treatment_c$Imp3, treatment_c$Imp4,
        treatment_c$Imp5, horizontal = TRUE,
        main = "Treatment C: Impulsivity over Trials 1 thru 5",
        xlab = "Impulsivity Time (seconds)",
        names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5"))

#### Interpretation of Control Group Boxplots ####

# Trial 1: 
# Shape: skewed right
# Center: median around 73 sec
# Spread: 66 sec to 77 sec
# Unusual Features: outlier around 80 sec

# Trial 2: 
# Shape: skewed left 
# Center: median around 67 sec
# Spread: 62 sec to 75 sec
# Unusual Features: none

# Trial 3: 
# Shape: skewed left 
# Center: median around 65 sec
# Spread: 60 sec to 74 sec
# Unusual Features: none

# Trial 4: 
# Shape: symmetrical
# Center: median around 65 sec
# Spread: 58 sec to 73 sec
# Unusual Features: none

# Trial 5: 
# Shape: skewed right
# Center: median around 62 sec
# Spread: 55 sec to 66 sec
# Unusual Features: outlier at 68 sec

boxplot(treatment_l$Imp1, treatment_l$Imp2, treatment_l$Imp3, treatment_l$Imp4,
        treatment_l$Imp5, horizontal = TRUE,
        main = "Treatment L: Impulsivity over Trials 1 thru 5",
        xlab = "Impulsivity Time (seconds)",
        names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5"))

##### Interpretation of L Group Boxplots ######

# Trial 1: 
# Shape: symmetrical 
# Center: median around 73 sec
# Spread: 66 sec to 77 sec
# Unusual Features: outlier around 78 and 65

# Trial 2: 
# Shape: skewed left 
# Center: median around 68 sec
# Spread: 63 sec to 74 sec
# Unusual Features: none

# Trial 3: 
# Shape: skewed left 
# Center: median around 65 sec
# Spread: 59 sec to 73 sec
# Unusual Features: outlier at 56 sec

# Trial 4: 
# Shape: symmetrical
# Center: median around 65 sec
# Spread: 58 sec to 72 sec
# Unusual Features: none

# Trial 5: 
# Shape: skewed right
# Center: median around 60 sec
# Spread: 53 sec to 67 sec
# Unusual Features: outlier at 72 sec

boxplot(treatment_n$Imp1, treatment_n$Imp2, treatment_n$Imp3, treatment_n$Imp4,
        treatment_n$Imp5, horizontal = TRUE,
        main = "Treatment N: Impulsivity over Trials 1 thru 5",
        xlab = "Impulsivity Time (seconds)",
        names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5"))

##### Interpretation of N Group Boxplots ######

# Trial 1: 
# Shape: skewed right
# Center: median around 73 sec
# Spread: 67 sec to 77 sec
# Unusual Features: none

# Trial 2: 
# Shape: skewed left
# Center: median around 68 sec
# Spread: 62 sec to 77 sec
# Unusual Features: outliers at 59 sec and 78 sec

# Trial 3: 
# Shape: skewed left 
# Center: median around 65 sec
# Spread: 59 sec to 73 sec
# Unusual Features: none

# Trial 4: 
# Shape: symmetrical
# Center: median around 65 sec
# Spread: 59 sec to 71 sec
# Unusual Features: none

# Trial 5: 
# Shape: symmetrical
# Center: median around 60 sec
# Spread: 53 sec to 67 sec
# Unusual Features: none

#### Box plots of Impulsivity across gender ###pick up here 4/1/19

### subset into Gender ###

female <-impulsivity_stack[impulsivity_stack$Gender == "F", 1:11]
male <- impulsivity_stack[impulsivity_stack$Gender == "M", 1:11]

boxplot(female$Imp1, female$Imp2, female$Imp3, female$Imp4,
        female$Imp5, horizontal = TRUE,
        main = "Female Subjects: Impulsivity over Trials 1 thru 5",
        xlab = "Impulsivity Time (seconds)",
        names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5"))

##### Interpretation of Female Subject Boxplots ######

# Trial 1: 
# Shape: symmetrical 
# Center: median around 72 sec
# Spread: 68 sec to 76 sec
# Unusual Features: outliers at 66, 67, 77, 78, 79 sec

# Trial 2: 
# Shape: symmetrical
# Center: median around 68 sec
# Spread: 62 sec to 74 sec
# Unusual Features: outliers at 59, 61, 75, 76 sec

# Trial 3: 
# Shape: symmetrical
# Center: median around 65 sec
# Spread: 59 sec to 73 sec
# Unusual Features: outlier at 56 sec

# Trial 4: 
# Shape: symmetrical
# Center: median around 65 sec
# Spread: 58 sec to 72 sec
# Unusual Features: none

# Trial 5: 
# Shape: symmetrical
# Center: median around 60 sec
# Spread: 53 sec to 67 sec
# Unusual Features: outlier at 71 sec

boxplot(male$Imp1, male$Imp2, male$Imp3, male$Imp4,
        male$Imp5, horizontal = TRUE,
        main = "Male Subjects: Impulsivity over Trials 1 thru 5",
        xlab = "Impulsivity Time (seconds)",
        names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5"))

##### Interpretation of Male Subject Boxplots ######

# Trial 1: 
# Shape: symmetrical 
# Center: median around 72 sec
# Spread: 65 sec to 79 sec
# Unusual Features: none

# Trial 2: 
# Shape: symmetrical
# Center: median around 68 sec
# Spread: 63 sec to 74 sec
# Unusual Features: outliers at 62, 75, 77 sec

# Trial 3: 
# Shape: skewed left
# Center: median around 65 sec
# Spread: 59 sec to 74 sec
# Unusual Features: none

# Trial 4: 
# Shape: symmetrical
# Center: median around 65 sec
# Spread: 58 sec to 72 sec
# Unusual Features: none

# Trial 5: 
# Shape: symmetrical
# Center: median around 61 sec
# Spread: 54 sec to 67 sec
# Unusual Features: none

##### Create a pdf document that has all of the plots #####

#### I can't seem to figure out why my plots are printing twice?

pdf("plots.pdf")


plot(hist(impulsivity_stack$Age[impulsivity_stack$TRT == "C"], main = "Age of Subjects
     in Treatment C ", xlab = "Age"))


plot(hist(impulsivity_stack$Age[impulsivity_stack$TRT == "L"], main = "Age of Subjects
     in Treatment L", xlab = "Age"))

plot(hist(impulsivity_stack$Age[impulsivity_stack$TRT == "N"], main = "Age of Subjects
     in Treatment N", xlab = "Age"))

plot(hist(impulsivity_stack$Age[impulsivity_stack$Gender == "F"],
          main = "Age of Female Subjects", xlab = "Age"))

plot(hist(impulsivity_stack$Age[impulsivity_stack$Gender == "M"],
          main = "Age of Male Subjects", xlab = "Age"))

plot(boxplot(impulsivity_stack$Imp1,impulsivity_stack$Imp2,impulsivity_stack$Imp3,
             impulsivity_stack$Imp4,impulsivity_stack$Imp5, 
             main = "Impulsivity Times over Trials 1 thru 5", 
             horizontal = TRUE,
             xlab = "Impulsivity Time (seconds)",
             names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5")))

plot(boxplot(treatment_c$Imp1, treatment_c$Imp2, treatment_c$Imp3, treatment_c$Imp4,
             treatment_c$Imp5, horizontal = TRUE,
             main = "Treatment C: Impulsivity over Trials 1 thru 5",
             xlab = "Impulsivity Time (seconds)",
             names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5")))

plot(boxplot(treatment_l$Imp1, treatment_l$Imp2, treatment_l$Imp3, treatment_l$Imp4,
             treatment_l$Imp5, horizontal = TRUE,
             main = "Treatment L: Impulsivity over Trials 1 thru 5",
             xlab = "Impulsivity Time (seconds)",
             names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5")))

plot(boxplot(treatment_n$Imp1, treatment_n$Imp2, treatment_n$Imp3, treatment_n$Imp4,
             treatment_n$Imp5, horizontal = TRUE,
             main = "Treatment N: Impulsivity over Trials 1 thru 5",
             xlab = "Impulsivity Time (seconds)",
             names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5")))

plot(boxplot(female$Imp1, female$Imp2, female$Imp3, female$Imp4,
             female$Imp5, horizontal = TRUE,
             main = "Female Subjects: Impulsivity over Trials 1 thru 5",
             xlab = "Impulsivity Time (seconds)",
             names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5")))

plot(boxplot(male$Imp1, male$Imp2, male$Imp3, male$Imp4,
             male$Imp5, horizontal = TRUE,
             main = "Male Subjects: Impulsivity over Trials 1 thru 5",
             xlab = "Impulsivity Time (seconds)",
             names = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5")))


dev.off()
