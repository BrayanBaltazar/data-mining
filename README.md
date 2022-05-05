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

<H2><p align="Center">Practica Evaluatoria U1</p></H2>

<H2><p align="Center">FECHA: 22/03/22</p></H2>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

## EVALUATION UNIT 2

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
