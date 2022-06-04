#Baltazar Moreno Brayan
#Ramos Verdin Paula Andrea

#Generar tres gráficas con R que cuente la historia de los datos, 
#La primera que sea una gráfica de dispersión de puntos 
#La segunda que sea una gráfica en facetas
#La tercera una gráfica que nos diga algo estadístico como la distribución 
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






