# -*- coding: utf-8 -*-
"""
Created on Tue Oct 30 19:13:20 2018

@author: Carmen Biedma
"""

def vocales(palabra):
    resultado = []
    if isinstance(palabra,str):
        palabra = palabra.lower()     
        for i in palabra:
            if i == "a" or i=="e" or i=="i" or i=="o" or i=="u" :
                resultado.append(i)
    else:
        resultado = "El argumento tiene que ser de tipo String"
                
    return resultado

p = "HOLA"
print(p, " tiene las vocales ",vocales(p))
p = "RRR"
print(p, " tiene las vocales ",vocales(p))
p = "aeiou"
print(p, " tiene las vocales ",vocales(p))
p = 9
print(vocales(p))

