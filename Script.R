############################
# Different ways to load data
############################

#Method 1
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
plot(heart$age, heart$chol)







