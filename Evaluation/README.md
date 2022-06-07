# Evaluation Unit 3

First we added the requested libraries, previously the naiveBayes package was installed.

```R
library(e1071)
library(naivebayes)
library(caret)

install.packages('e1071')
```

Then we perform the data load, in this practice we are using the social_network_ads data collection.

```R
dataset <- read.csv("Social_Network_Ads.csv")
dataset = dataset[3:5]
```

We make a coding.

```R
dataset$Purchased=factor(dataset$Purchased,levels = c(0,1))
```

Next we will perform the division of the data, in which we have the test data and the training data, within which we are requesting the values to be compared at a value equal to 0.75.

```R
library(caTools)
set.seed(123)
split=sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
```

Then we mention the limitations of each one, then we mention the use of naive bayes in which we make the comparison of the data.

```R
training_set[-3]=scale(training_set[-3])
test_set[-3]=scale(test_set[-3])


classifier=naiveBayes(formula=Purchased ~ . ,
                       data=training_set,
                       type='C-classification',
                       kernel='linear')
y_pred=predict(classifier,newdata=test_set[-3])
y_pred
```

# Visualing Results

We generate the corresponding graph in which we make the comparison of salary income and age of the individuals.

```R
library(ggplot2)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add =
          TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3',
                                         'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_3/Evaluation/Plot%20Evaluation.png)

As a conclusion we have the possibility of seeing that in the graph shown, many of the individuals have a salary estimate in which they have the possibility of obtaining the product they aspire to, although most of them do not have a salary estimate or may not be old enough to acquire it. With this we have the possibility to see what is the approximate number of individuals who do meet the requirements. 