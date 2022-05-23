<p align="center">
    <img alt="Logo" src="https://www.tijuana.tecnm.mx/wp-content/uploads/2021/08/liston-de-logos-oficiales-educacion-tecnm-FEB-2021.jpg" width=850 height=250>
</p>

<H2><p align="Center">TECNOLÓGICO NACIONAL DE MÉXICO</p></H2>

<H2><p align="Center">INSTITUTO TECNOLÓGICO DE TIJUANA</p></H2>

<H2><p align="Center">SUBDIRECCIÓN ACADÉMICA</p></H2>

<H2><p align="Center">DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN</p></H2>

<H2><p align="Center">NOMBRE DE LOS ALUMNOS: </p></H2>

<H2><p align="Center">BALTAZAR MORENO BRAYAN (N. CONTROL: 18210703)</p></H2>

<H2><p align="Center">RAMOS VERDIN PAULA ANDREA (N.CONTROL: 18210721)</p></H2>

<H2><p align="Center">Carrera: Ingeniería Informática</p></H2>

<H2><p align="Center">MATERIA: Mineria de Datos</p></H2>

<H2><p align="Center">PROFESOR: JOSE CHRISTIAN ROMERO HERNANDEZ</p></H2>


<br>
<br>
<br>

##  Unit 3

## Simple Linear Regression

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

## Logistic Regression

# Practice 3 

First we need to import the data into our csv file.

```R
getwd()
setwd("C:/Users/paula/OneDrive/Documentos/9no Semestre/2.- Mineria de datos/Unidad 3")
getwd()

# Importing the dataset

dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]
```

Next we perform the division of our data, in which we have the test data and the training data, within which we are asking for the values to be compared at a value equal to 0.75.

```R
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')

library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

Then we perform the scaling of the function, where we first say, that the first values we want are the entertainment data and then the test data.

```R
# Feature scaling

training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```

We then fit what is logistic regression.

```R
# Fitting Logistic Regression to Training set

classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
```

The first thing to do is to request the test values by first asking for all the data at 3.
And then we ask for values greater than 0.5, 1 and 0.

```R
# Predicting the Test set results

prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```

Then we perform the confusion of the matrix, generating a small vector, in which certain values are requested and we ask it to display it in the form of 3*3.

```R
# Making the Confusion Matrix

cm = table(test_set[, 3], y_pred)
cm
```

Then we generate the following graphs, in which we request the test data and training data.

```R
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Practice/LogisticRegression/AgePurchased.png)

In the graph we can see that we asked for age, purchases and number of purchases with the estimated salary. As we can see the highest point is one that is the highest number of purchases made.

## Visualization the Training set result

Then we make the following graph in which we generate what is already the logistic regression.

```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Practice/LogisticRegression/Training%20Set.png)

In this graph we make a comparison in the training data, taking into account the estimated salary and age, all values that are lower are in red and the higher ones in green, as for example you can have an adult age but it may be that your financial status is not good then you will be in red, but if you have a young age at least 19 years old and your financial stability is good you will be in green.


## Visualization the Test set result

In this graph we make the same comparison as before but with the test values.

```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Practice/LogisticRegression/Test%20Set.png)

Unlike the previous graph, we can see that in this graph there are more red dots than green dots, which shows that most do not have a good salary estimate for their purchases.

## K-NN

# Practice 4

First we import our dataset.

```R
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

Coding of the target characteristic in the code.

```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

Then the data is split, one for testing and one for training, asking for the data to be split from 0.75 and these values will be taken as the entertainment data from 0.75 and these values will be taken as the test data.

```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

We split the data by scala feature.

```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

Then we perform the KNN adaptation, first we import the class library and then the data is split asking first, that the test data is less than -3 and then that the training data is greater than 3.

```R
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)
```
## Visualization the Trainig Set result 

We generate the first graph (Training Set).

```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Practice/KNN/Training%20Set.png)

In this graph we present the results in formation, within which we see the estimated salary along with the age of the people. And we can also see a large percentage of people who have a good economic situation and can make the purchases they want.

## Visualization the Test set result

We generate the second graph (Test Set).

```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Practice/KNN/Training%20Set.png)

Unlike the previous graph, in this one we can see that the test data is a little more on the red side, these are more people whose estimated salary is lower.