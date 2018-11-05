# -*- coding: utf-8 -*-
"""
Created on Sun Oct 28 11:14:10 2018

@author: Carmen Biedma
"""

def eliminar_letras(palabra,letra):
    resultado = ""
    if isinstance(palabra,str)==True and isinstance(letra,str)==True:
        for i in palabra:
            if i != letra:
                resultado += i
    else:
        resultado = "Ambos argumentos deben ser de tipo String"
        
    return resultado

    
a = "Hola"
print(eliminar_letras(a,"a"))
print(eliminar_letras(a,""))

a = "Holaaaaa"
print(eliminar_letras(a,"a"))

a = "Hola"
print(eliminar_letras(a,"A"))
print(eliminar_letras(a,"H"))

a = "aaaaaaaaaaaaaa"
print(eliminar_letras(a,"a"))

a = 2
print(eliminar_letras(a,"a"))
print(eliminar_letras(a,7))

