# -*- coding: utf-8 -*-
"""
Created on Sun Oct 28 11:25:36 2018

@author: Carmen Biedma
"""

def buscar(palabra,sub):

    posicion = -1

    if isinstance(palabra,str)==True and isinstance(sub,str)==True:
        esta = False
        i=0
        j=0
        while esta == False and i<len(palabra) :
            if palabra[i] == sub[j] : 
               if j == 0 : posicion = i 
               i = i+1
               j = j+1
            
            elif j == len(sub):
                esta=True
            else: 
                j = 0
                if posicion == -1: 
                    i=i+1
                else:
                    i = posicion + 1
                posicion = -1
                       
    else:
        posicion = "Ambos argumentos deben ser de tipo String"
        
    return posicion

p  = "HOLLA"
print("'LA' aparece en la cadena" ,p, "en la posicion", buscar(p,"LA"))
print("'LO' aparece en la cadena" ,p, "en la posicion", buscar(p,"LO"))
print("'HOLA' aparece en la cadena" ,p, "en la posicion", buscar(p,"HOLA"))
print("'A' aparece en la cadena" ,p, "en la posicion", buscar(p,"A"))
print(buscar(p,9))
print(buscar(8,"LA"))

