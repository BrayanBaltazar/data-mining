install.packages("ggplot2")

library(ggplot2)

getwd()

setwd("C:/Users/braya/Desktop/Unit_2")

getwd()

movies <- read.csv("Project-Data.csv")

movies <- movies [c(3,6,8,18)]




movies<-movies[
movies$Genre=="action"|
movies$Genre=="adventure"|
movies$Genre=="animation"|movies$Genre=="comedy"|
movies$Genre=="drama",]

movies<-movies[
movies$Studio=="Buena Vista Studios"|
movies$Studio=="Fox"| movies$Studio=="Paramount Pictures"|
movies$Studio=="Sony"|movies$Studio=="Universal" |
movies$Studio=="WB",]

colnames(movies) <- c("Genre", "Studio", "BudgetInMillions", "GrossUS")



str(movies)

summary(movies)

BoxPlot <- ggplot(movies, aes(x=Genre, y=GrossUS, color=Studio, size=BudgetInMillions))

BoxPlot + geom_boxplot()

BoxPlot + geom_jitter(shape=20) + geom_boxplot(size=0.5,alpha=0.8,color="Black",
outlier.shape = NA)+ theme(plot.title = element_text(color="Black", size=16, face="bold", hjust = 0.5),
axis.title.x = element_text(color="Purple", size=16), axis.title.y = element_text(color="Purple", size=16))+  ggtitle("Domestic Gross % by Genre") + ylab("GrossUS") + xlab("Genre")
