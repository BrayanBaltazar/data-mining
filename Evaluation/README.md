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

```R
dataset$Purchased=factor(dataset$Purchased,levels = c(0,1))
```

```R
library(caTools)
set.seed(123)
split=sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
```

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

