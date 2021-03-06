#Baltazar Moreno Brayan
#Ramos Verdin Paula Andrea

#Generar tres gr�ficas con R que cuente la historia de los datos, 
#La primera que sea una gr�fica de dispersi�n de puntos 
#La segunda que sea una gr�fica en facetas
#La tercera una gr�fica que nos diga algo estad�stico como la distribuci�n 
#que tienen los datos y que contenga la capa temas (theme). 

#Read CSV
cars <- read.csv(file.choose())

#Plots

#Dispersion de Puntos
library(ggplot2)

ggplot(cars, aes(x=Cylinders, y=Model, 
                   color=Origin)) + 
  geom_point()

#Facetas

f <- ggplot(cars, aes(x=Cylinders, y=Displacement,
                        color=Origin))

f + geom_point() + facet_grid(Origin~.)

#Distribucion

a <- ggplot(cars, aes(x=Cylinders))
b <- a + geom_histogram(aes(fill=Origin),
                        color="Black")

b +
  xlab("Origen x Cylinders") +
  ylab("Number of Displacement") + ggtitle("Origin of cars") +
  theme(axis.title.x = element_text(color = "Black", size=10),
        axis.title.y = element_text(color = "Black", size=10),
  )






