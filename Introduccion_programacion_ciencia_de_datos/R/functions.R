#EJERCICIO 1 _______________________________________

#Crea una función impares que dado un vector devuelva la cantidad de elementos impares que contiene.

impares <- function(v){
  
  length(which(v%%2!=0))
}

a<-c(1:10)
impares(a)

#EJERCICIO 2 _____________________________________

#Crea una función cambio que dada una matriz de numeros enteros reemplaze todos los NA por el valor 0.

cambio <- function(m){
  
  m[which(is.na(b))] <- 0
  m
}

b <- matrix(c(1:4,NA,6:10),nrow = 2,ncol = 5)
cambio(b)

#EJERCICIO 3 _____________________________________

#Crea una función unir que dados dos vectores devuelva un nuevo vector con los elementos de ambos
#vectores sin repetidos.

unir <- function(x,y) {
  
  union(x,y)
  
}

c = c(1:5)
d = c(2:6)
unir(c,d)

#EJERCICIO 4 ____________________________________

#Crea una función vyc que dado un string devuelva una lista de dos componentes que contenga las
#vocales y las consonantes.

vyc <- function(s){
  
  V <- c("a","e","i","o","u")
  C <- setdiff(letters,V)
  
  aux <- unlist(strsplit(s,split=""))
  vocales <- setdiff(aux,C)
  consonantes <- setdiff(aux,V)
  list(vocales,consonantes)
}

vyc("hola")

#EJERCICIO 5 _____________________________________

#Crea una función partir que dado un vector v y dos valores x e y (siendo y opcional), retorne un
#vector con los valores que aparecen luego del primer x y hasta el primer y. De no indicarse el valor de y
#se devolveran todos los valores que aparecen luego del primer x hasta el final del vector.

partir <- function(v,x=v[1],y=v[length(v)]){
  
  v[grep(x,v):grep(y,v)]
  
}

