# -*- coding: utf-8 -*-
"""
Created on Tue Oct 30 19:24:49 2018

@author: Carmen Biedma
"""

def es_inversa(palabra1,palabra2):
    inv = True
    if isinstance(palabra1,str)==True and isinstance(palabra2,str)==True:
        i = 0
        while inv and i<len(palabra1):
         if palabra1[i] == palabra2[-(i+1)]:
            i = i+1
         else:
            inv=False
        
    else:
        inv = "Ambos argumentos deben ser de tipo String"
        
    return inv

print(es_inversa("HOLA","ALOH"))
print(es_inversa("HOLA","HOLA"))
print(es_inversa(2,2))