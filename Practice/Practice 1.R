#Baltazar Moreno Brayan
#Ramos Verdin Paula Andrea

# Import the Dataset

dataset <- read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')

library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set

regressor = lm(formula = Salary ~ YearsExperience, 
              data = dataset)
summary(regressor)

# Predicting the Test set results

y_pred = predict(regressor, newdata = test_set)



