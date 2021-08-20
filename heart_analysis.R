############################
# Understanding variables
# sex - Sex of patient (1: Male; 0: Female)
# cp - Chest pain (1: typical angina) (2: atypical angina)
# (3: non-anginal pain) (4: asymptomatic)
# trtbps - Resting blood pressure (mmHg)
# chol - Cholesterol in mg/dl
# fbs - Fasting blood sugar > 120 mg/dl (1 = T; 0 = F)
# restecg - Resting electrocardiograph results
# thalachh - Maximum heart rate achieved
# exng - Exercise induced angina (1 = Y; 0 = N)
# oldpeak - Previous peak
# slp - slope
# caa - # of major vessels
# thal - thal rate
# output - 1 - high risk, 0 - low risk HA
############################
# Loading data
############################
heart <- read.csv('~/Documents/Projects/Data Analyst/R/Heart_Analysis/heart.csv')
install.packages("caret", dependencies = TRUE)
library("caret")
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
# makes green bars + relabel Title(main) & x label
hist(heart$cp, col = "green", xlab = "Chest Pains",
main = "Histogram of Chest Pains")
#Feature plots - creates box plot
#make sure to install caret
# convert y-var to a factor, if already a factor just input data$var
featurePlot(x = heart[,1:13],
  y = as.factor(heart$cp),
  plot = "box",
  strip = strip.custom(par.strip.text = list(cex=.7)),
  scales = list(x = list(relation="free"),
  y = list(relation="free")))

