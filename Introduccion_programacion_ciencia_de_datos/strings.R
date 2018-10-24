#EJERCICIO 1 ____________________________________________________

#. Crea un vector de strings que contengan 3 datos: tu primer nombre y tus dos apellidos. A partir de
#éste crea un nuevo string con la inicial de tu nombre (y un punto) y el apellido completo utilizando las
#utilidades de R. En mi caso debería quedar: R. Romero Zaliz


nombre = c("Carmen","Biedma","Rodriguez")
nombreFinal<-paste(paste(substr(nombre[1],1,1),"",sep="."),nombre[2],nombre[3]," ")
nombreFinal

#EJERCICIO 2 ____________________________________________________

#Dado un vector de fechas, expresadas como strings (e.g., "2005-11-28"), muestra solamente aquellas
#correspondientes a los meses impares.

fechas <- c("2005-11-28","2005-12-28","2005-1-28","2005-2-28","2005-5-28")
fechas[c(which(as.numeric(substr(fechas,6,7)) %% 2 == TRUE))]

#EJERCICIO 3 ____________________________________________________

#Dado un string con varias palabras (e.g., "Esta es una frase, pero no cualquier frase.") crea un vector con
#cada una de las plabras del string (["Esta","es","una","frase","pero","no","cualquier","frase"]).

frase <- "Esta es una frase, pero no cualquier frase."
vec <- unlist(strsplit(frase,split=c(" ",",",".")))
vec

#EJERCICIO 4 ____________________________________________________

#Busca las plabras que usan solamente las vocales "a" y "e" en un vector de strings.

a = union(union(vec[grep(vec,pattern = "i")],vec[grep(vec,pattern = "o")]),vec[grep(vec,pattern = "o")])
setdiff(vec,a)

#EJERCICIO 5 ____________________________________________________

#Dados tres vectores dia, mes y anno crea un vector con las fechas completas. Si la fecha es inválida,
#ésta se descartará (hint: investiga la función as.Date).

dia <- c("1","2","3","4")
mes <- c("1","2","3","14")
anno <- c("2001","2002","2003","2004")

matrix(c(dia,mes,anno),nrow = length(dia),ncol = 3)
fechas <- paste(paste(dia,mes,sep="-"),anno,sep="-")
as.Date(fechas)

