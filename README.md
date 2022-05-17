# Unit 3

# Practice 1 

First we need to import our csv that we work with called Salary Data which shows the salary based on years of experience.

In this way we look for our CSV file on our computer.

```R
getwd()
setwd("C:/Users/paula/OneDrive/Documentos/9no Semestre/2.- Mineria de datos/Unidad 3")
getwd()

# Importing the dataset

dataset <- read.csv('Salary_Data.csv')
```

Now to prepare the data with the catools package so that it grabs the non-sequential random data.

```R
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')

library(caTools)
set.seed(123)
```

Now, the division to prepare the data sets that we are going to work with, this generates some true and false and with the subset we will divide them as training set and test set.

```R
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

We will now perform a regression of the lm or linear model with the relationship between salary and years of experience.

```R
# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,data = dataset)
summary(regressor)
```

We now make the prediction on the test data with the regressor.

```R
# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
```

## Now for the charts we have the following code:

## Viewing the results of the Training Set

```R
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Practice/Training%20Set.png)

Here we have the salary graph based on the experience with the Training set, we have our positive constant that indicates that the more years the better the salary, and that the prediction with the training set is a positive line graph.

## Viewing the results of the Test Set

```R
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Practice/Test%20Set.png)

Here we have the same graph but with our Test Set with 10 observations, now we see the exact same thing that our prediction based on the data is positive, we see that some actual results are below the constant but the output is positive and increasing.