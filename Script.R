############################
# Understanding variables
# sex - Sex of patient (1: Male; 0: Female)
# cp - Chest pain
# trtbps - Resting blood pressure (mmHg)
# chol - Cholesterol in mg/dl 
# fbs - Fasting blood sugar > 120 mg/dl (1 = T; 0 = F)
# restecg - Resting electrocardiograph results
# thalachh - Maximum heart rate achieved
# exng - Exercise induced angina (1 = Y; 0 = N)
# oldpeak - Previous peak
############################
# Loading data
############################
heart <- read.csv('~/Documents/Projects/Data Analyst/R/Heart_Analysis/heart.csv')

#view the data
View(heart) 

############################
# Display summary stats
############################

# head()/ tail()
head(heart, 4) #shows first four 
tail(heart, 4) #shows last four

#summary()
summary(heart)
summary(heart$age)

#check missing data
sum(is.na(heart))

# Descriptive Analysis
#skimr() - expands on summary() by providing larger set of stats
install.packages("skimr")
# https://github.com.ropensci/skimr

library(skimr)

skim(heart) # perform skim to display in-depth summary stats/

#group data by Species then perform skim, highlite -> use control-enter
heart %>%
  dplyr::group_by(chol)%>%
  skim() 

############################
# Quick Data visualization
# R base plot()
############################

# Panel plots
plot(heart)
plot(heart, col="red") #col = color

# Scatter plot
# Correlation between Age and Cholesterol 
plot(heart$chol, heart$age)

plot(heart$age, heart$chol, col = "blue") #change color to blue

plot(heart$age, heart$chol, col = "blue",
     xlab = "Age", ylab = "Cholesterol") #Color + Label change

#Histogram - Frequency of Chest Pains
hist(heart$cp)
hist(heart$cp, col = "green", xlab = "Chest Pains") # makes green bars







