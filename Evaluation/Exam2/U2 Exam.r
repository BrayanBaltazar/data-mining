install.packages("ggplot2")

library(ggplot2)

getwd()

setwd("C:/data-mining/Evaluation/Exam2")

getwd()

Pelicula <- read.csv(file.choose())

Pelicula <- Pelicula [c(3,6,8,17)]




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

colnames(Pelicula) <- c("Genre", "Studio", "BudgetIn $ M", "GrossUS")|



str(Pelicula)

summary(Pelicula)

BoxPlot <- ggplot(Pelicula, aes(x=Genre, y=GrossUS, color=Studio, size=BudgetInMillions))

BoxPlot + geom_boxplot()

BoxPlot + geom_jitter(shape=20) + geom_boxplot(size=0.5,alpha=0.8,color="Black",
outlier.shape = NA)+ theme(plot.title = element_text(color="Black",size=16, face="bold", hjust = 0.5),
axis.title.x = element_text(color="Purple", size=16), axis.title.y = element_text(color="Purple", size=16))
+  ggtitle("Domestic Gross % by Genre") + ylab("GrossUS") + xlab("Genre")
