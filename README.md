
# Evaluation U4

## Introduction

Implement the K-Means clustering model with the Iris.csv dataset found at  using the found at https://github.com/jcromerohdz/iris using the kmeans() method in R. Once the clustering model is obtained do the corresponding data visualization analysis.

## Development

First we import the csv data we are going to use, then we assign the columns we are going to work with.

```R
getwd()
setwd("C:/data-mining/Evaluation")
getwd()

# Importing the dataset
dataset = read.csv('iris.csv')
dataset = dataset[1:4]
```

# Visualing The Elbow Method

We determine the number of clusters to use through the Elbow method, for that we create a vector called VEC that through a cycle from 1 to 10 will save the sum of the squares within each group and with the help of Kmeans we will obtain the number of clusters.And we are looking for the curve that would be 3

```R
# Using the elbow method to find the optimal number of clusters
set.seed(6)
vec = vector()
for (i in 1:10) vec[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'VEC')
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_4/Evaluation/Plot%20Elbow.png)

Here we created the number of clusters which were 3 together with a random seed, it is worth mentioning that kmeans works in a way that through iterations between the data and these classifies them based on their characteristics.

```R
# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster
```

# Visualing The Clusters

```R
# install.packages('cluster')
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of iris'),
         xlab = 'Length',
         ylab = 'Width')
```
![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_4/Evaluation/Plot%20Clusters.png)

Here we can visualize the grouping of the data, which separates them by similarities between sizes, we see that between group 1 and 2 have similarities and group 3 is totally isolated which is the setosa iris, on the other hand we have iris virginica and vergicolor that by their size are similar and that is why they share characteristics and is shown in the graph. 

<p align="center">
    <img alt="Logo" src="https://www.tijuana.tecnm.mx/wp-content/uploads/2021/08/liston-de-logos-oficiales-educacion-tecnm-FEB-2021.jpg" width=850 height=250>
</p>

<H2><p align="Center">TECNOLÓGICO NACIONAL DE MÉXICO</p></H2>

<H2><p align="Center">INSTITUTO TECNOLÓGICO DE TIJUANA</p></H2>

<H2><p align="Center">SUBDIRECCIÓN ACADÉMICA</p></H2>

<H2><p align="Center">DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN</p></H2>

<H2><p align="Center">NOMBRE DE LOS ALUMNOS: </p></H2>

<H2><p align="Center">BALTAZAR MORENO BRAYAN (N. CONTROL: 18210703)</p></H2>

<H2><p align="Center">RAMOS VERDIN PAULA ANDREA (N. CONTROL: 18210721)</p></H2>

<H2><p align="Center">Carrera: Ingeniería Informática</p></H2>

<H2><p align="Center">MATERIA: Mineria de Datos</p></H2>

<H2><p align="Center">PROFESOR: JOSE CHRISTIAN ROMERO HERNANDEZ</p></H2>

<H2><p align="Center">Practica Evaluatoria U2</p></H2>

<H2><p align="Center">FECHA: 04/05/22</p></H2>

<br>
<br>
<br>
<br>
<br>


## EVALUATION UNIT 2

## Introduction

A new code must be created to obtain the same data from the graph, since the previous code was completely lost, and what we want to achieve with this one is that it is as similar as possible to the original code, which was provided to us with a new data set to make this possible.

# Installation of packages for use of graphing

```R
#Install Packages

install.packages("ggplot2")
```

# Use of libraries

```R
library(ggplot2)
```

# search the csv file and read

```R
getwd()

setwd("C:/data-mining/Evaluation/Exam2")

getwd()

Pelicula <- read.csv(file.choose())

Pelicula <- Pelicula [c(3,6,8,17)]
```

# Declaration of variables of genres and studies

```R
Pelicula<-Pelicula[
Pelicula$Genre=="action"|
Pelicula$Genre=="adventure"|
Pelicula$Genre=="animation"|
Pelicula$Genre=="comedy"|
Pelicula$Genre=="drama",]

Pelicula<-Pelicula[
Pelicula$Studio=="Buena Vista Studios"|
Pelicula$Studio=="Fox"| 
Pelicula$Studio=="Paramount Pictures"|
Pelicula$Studio=="Sony"|
Pelicula$Studio=="Universal" |
Pelicula$Studio=="WB",]
```

# Create columns

```R
colnames(Pelicula) <- c("Genre", "Studio", "BudgetIn $ M", "GrossUS")
```

# Construction of cinema graphic development

```R
str(Pelicula)

summary(Pelicula)

BoxPlot <- ggplot(Pelicula, aes(x=Genre, y=GrossUS, color=Studio, size=BudgetInMillions))
```

# Properties

```R
BoxPlot + geom_boxplot()

BoxPlot + geom_jitter(shape=20) + geom_boxplot(size=0.5,alpha=0.8,color="Black",
outlier.shape = NA)+ theme(plot.title = element_text(color="Black",size=16, face="bold", hjust = 0.5),
axis.title.x = element_text(color="Purple", size=16), axis.title.y = element_text(color="Purple", size=16))
+  ggtitle("Domestic Gross % by Genre") + ylab("GrossUS") + xlab("Genre")
```

# generated graph

![](https://github.com/BrayanBaltazar/data-mining/blob/Unit_2/Evaluation/Exam2/Graf.png)