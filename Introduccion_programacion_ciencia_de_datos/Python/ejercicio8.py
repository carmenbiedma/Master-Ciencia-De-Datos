# -*- coding: utf-8 -*-
"""
Created on Wed Oct 31 11:17:38 2018

@author: Carmen Biedma
"""

def eco_palabra(palabra):
    resultado = ""
    if isinstance(palabra,str)==True:
        for i in range(len(palabra)):
            resultado = resultado + palabra
    else:
        resultado = "Ambos argumentos deben ser de tipo String"
        
    return resultado

print(eco_palabra("hola"))
print(eco_palabra("eo"))