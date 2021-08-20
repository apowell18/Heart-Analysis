############################
# Loading data
# import libraries
############################
h_data <- read.csv('~/Documents/Projects/Data Analyst/R/Heart_Analysis/heart.csv')

install.packages("caret", dependencies = TRUE)
library("caret")

#check for missing data
sum(is.na(h_data))

# achive reproducible model: set the random seed number
set.seed(100)

#performs stratified random split of the data set
TrainingIndex <- createDataPartition(h_data$output, p=0.8, list= FALSE)
TrainingSet <- h_data[TrainingIndex,] #Training set
TestingSet <- h_data[-TrainingIndex,] #Testing set (- is negate)

# compare scatterplot
plot(TestingSet)

plot(TrainingSet)

#########################
# Predicting Heart Attacks
# This model is not appropriate for this data set
#########################
# SVM model (polynomial kernel)
#build training model
Model <- train(as.factor(output) ~ ., data = TrainingSet, 
               method = "svmPoly", 
               na.action = na.omit,
               preProcess = c("scale", "center"),
               trControl= trainControl(method="none"), 
               tuneGrid = data.frame(degree=1, scale=1, C=1)
               )

#build cv model
Model.cv <- train(as.factor(output) ~ ., data = TrainingSet, 
               method = "svmPoly", 
               na.action = na.omit,
               preProcess = c("scale", "center"),
               trControl= trainControl(method="cv", number=10), 
               tuneGrid = data.frame(degree=1, scale=1, C=1)
               )
# Apply model for prediction 
Model.training <- predict(Model, TrainingSet) #Apply model to make prediction on Training set
Model.testing <- predict(Model, TestingSet) #Apply model to make prediction on Testing set
Model.cv <- predict(Model.cv, TrainingSet) #Perform cross-validation

#Model performance 
Model.training.confusion <- confusionMatrix(Model.training, as.factor(TrainingSet$output))
Model.testing.confusion <- confusionMatrix(Model.testing, as.factor(TestingSet$output))
Model.cv.confusion <- confusionMatrix(Model.cv, as.factor(TrainingSet$output))

print(Model.training.confusion) #Accuracy 85.6%
print(Model.testing.confusion) #Accuracy 80.0%
print(Model.cv.confusion)

# Feature Importance
Importance <- varImp(Model)
plot(Importance) 
####
# Chest pains
# Old peak
# Maximum heart rate achieved
# Excercise