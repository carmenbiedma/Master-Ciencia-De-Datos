# -*- coding: utf-8 -*-
"""
Created on Wed Oct 31 11:11:51 2018

@author: Carmen Biedma
"""

def comunes(palabra1,palabra2):
    resultado = []
    if isinstance(palabra1,str)==True and isinstance(palabra2,str)==True:
        for i in palabra1:
            if palabra2.find(i) != -1:
                resultado.append(i) 
    else:
        resultado = "Ambos argumentos deben ser de tipo String"
        
    return resultado

print(comunes("HOLA","ADIOS"))
print(comunes("PARAGUAS","MIO"))
print(comunes("HOLA","HOLA"))