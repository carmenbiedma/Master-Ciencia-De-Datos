# -*- coding: utf-8 -*-
"""
Created on Tue Oct 30 18:54:54 2018

@author: Carmen Biedma
"""

def num_vocales(palabra):
    if isinstance(palabra,str):
        palabra = palabra.lower()
        cont = 0
        for i in palabra:
            if i == "a" or i=="e" or i=="i" or i=="o" or i=="u" :
                cont= cont +1
    else:
        cont = "El argumento tiene que ser de tipo String"
                
    return cont
    
p = "aAaa"    
print(p," tiene ",num_vocales(p)," vocales")
p = "Hola"    
print(p," tiene ",num_vocales(p)," vocales")
p = "Aguacate"    
print(p," tiene ",num_vocales(p)," vocales")
p = "RRRR"    
print(p," tiene ",num_vocales(p)," vocales")
