#EJERCICIO 1 _______________________________________________

#Pide al usuario que introduzca un string s y un número n y que muestre en pantalla n veces seguidas el
#string s (sin espacios entre palabra y palabra).

cat("Introduce un string")
s <- readline()
cat("Introduce un entero")
n <- as.numeric(readline())
repetido <- rep(s,n)
paste(repetido,collapse="")

#EJERCICIO 2 _______________________________________________

#Crea tres ficheros llamados dos.txt, tres.txt y cinco.txt que contenga la tabla del 2, la del 3 y la
#del 5 respectivamente (los primeros 10 valores de cada tabla, un número en cada línea de cada fichero).

#EJERCICIO 3 _______________________________________________

#Carga los tres ficheros creados en el punto anterior y construye una matriz que, en cada columna, tengo
#el contenido de cada fichero.

dos <- scan("dos.txt")
tres <- scan("tres.txt")
cinco <- scan("cinco.txt")
tablas <- matrix(c(dos,tres,cinco),nrow = length(dos),ncol = 3)
tablas


#EJERCICIO 4 _______________________________________________

#Escribe las cinco primera filas de matriz del ejercicio anterior en un fichero nuevo llamado prime.txt y
#las cinco últimas en otro fichero llamado fin.txt. Ambos ficheros deben tener los datos separados por
#comas.

write(tablas[1:5,],file = "prime.txt",sep = ",")
scan("primeras5.txt",sep = ",")
write(tablas[5:10,],file = "fin.txt",sep = ",")
scan("ultimas5.txt",sep = ",")


#EJERCICIO 5 _______________________________________________

#Dados dos números introducidos por el usuario f y c, crea un cuadrado de f filas y c columnas con el
#caracter "x". Un ejemplo con f=4 y c=3 sería:

cat("Introduce un entero")
f <- as.numeric(readline())
cat("Introduce otro entero")
c <- as.numeric(readline())
cat(rep(paste(rep("X",c),collapse = ""),f),sep="\n")
    