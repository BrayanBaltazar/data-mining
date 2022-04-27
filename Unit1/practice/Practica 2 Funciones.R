#Mineria de datos
#Practica 2

#Funcion 1 Suma
sum(1, c(4, 6))

suma <- function(...) {
  l <- list(...)
  s <- 0
  for (x in l) {
    s <- s + x
  }
  return(s)
}

#Funcion 2 Potencia al 5ta
f <- function(x) {
  x^5
}
f(5)

#Funcion 3 matriz
n <- 6
notas <- array(runif(n*2*2, max = 10), dim = c(n, 3, 2))
notas
# Cadena de caracteres entre comillas 
"Hola"

#Funcion 4 Lista multidimencional 

l <- list(1:3, "x", TRUE, 2.0)
dim(l) <-  c(2, 2)
l

#Funcion 5
f <- function(variable) {
  length(unique(variable))
}
sapply(mtcars, f)

#Funcion 6 return que devuelve valor maximo 
maximo <- function(a, b) {
  if (a > b) {
    m <- a
  } else {
    m <- b
  }
  return(m)
}
maximo(14, 20)

#Funcion 7 Suma con variables locales

v <- 6
s <- 2
suma <- function(v) {
  s <- 0
  for (x in v) {
    s <- s + x
  }
  s
}
suma(c(2, 2, -3))

#Funcion 8 de aproximacion para una integral con indice superior 0 e inferior 5
f <- function(x) {
  2*x^2 + 7
}
integrate(f, 0, 5)

#Funcion 9 Suma con variables globales
w <- 9
f <- function(x) {
  x + w
}
f(6)

#Funcion 10 Suma de un n??mero variable de escalares
suma <- function(...) {
  l <- list(...)
  s <- 0
  for (x in l) {
    s <- s + x
  }
  return(s)
}
suma(3, 7)

#Funcion 11
Suma_x <- function(Num, x){
  resultado <- Num + x
  return(resultado)
  
}
Suma_x(Num = 5 , x = 60)

#Funcion 12 para crear lista y operaciones basicas suma y resta
operaciones <- list(s = suma, r = resta)

#Funcion 13 para sacar el area de un cuadrado
area_cuada <- function(lado1, lado2) 
{
  lado1 * lado2
}
area_cuada(lado1 = 2, lado2 = 3)

area_cuada(3,3)

#Funcion 14 Suma 
suma(1, 2, 3)

#Funcion 15 resta
resta  <- function(a, b) a - b
operaciones[[1]](2, 4)
operaciones[[2]](2, 4)

#Funcion 16 para potencia al cuadrado
f <- function(x) {
  x^2
}
f(14)

#Funcion 17 para indicar la distancia entre dos puntos (parametros)
distancia_eu <- function(x1, y1, x2, y2) {
  sqrt((x1 - x2)^2 + (y1 - y2)^2)
}
distancia_eu(1, 1, 2, 2)

#Funcion 18 uso de if 
dividendo <- 13
divisor <- 0
if (divisor != 0) {
  cat(dividendo, "/", divisor, "=", dividendo / divisor, "\n")
} else {
  print("No es posible dividir entre 0")
}

#Funcion 19 sentencia if anidadas, hace recorrido e indica numero mayor 
x <- 3; y <- 9; z <- 13
if (x > y) {
  if (x > z) {
    mayor <- x
  } else {
    mayor <- z
  }
} else {
  if (y > z) {
    mayor <- y
  } else {
    mayor <- z
  }
}
mayor

#Funcion 20 para rango entre 2 numeros dados
rango <- function(v) {
  c(min(v), max(v))
}
(v <- sample(48, 14))