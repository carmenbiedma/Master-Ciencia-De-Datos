# -*- coding: utf-8 -*-
"""
Created on Sat Oct 26 09:30:16 2018

@author: Carmen Biedma
"""

def contar_letras(palabra,letra):
    cont = 0
    if isinstance(palabra,str)==True and isinstance(letra,str)==True:
        for i in palabra:
            if i == letra:
                cont = cont +1
    else:
        cont = "Ambos argumentos deben ser de tipo String"
        
    return cont
    
p = "HOLA"

print(contar_letras(palabra = p, letra = "H"))
print(contar_letras(palabra = p, letra = "2"))

p="HOOOOLA"
print(contar_letras(palabra = p, letra = "O"))
print(contar_letras(palabra = p, letra = "o"))

p = 9 
print(contar_letras(palabra = p, letra = "O"))
print(contar_letras(palabra = p, letra = 1))

