#!/usr/bin/env python3
# -*- coding: utf-8 -*-

##################################################
### Control de flujo
##################################################

import math

##################################################
### Declaraciones `if-else`
##################################################

z = (3.2,0.2)
if Norma(z[0],z[1]) <= 4:
    print("Dentro del círculo")

z = (4.2, 0.2)
if Norma(z[0],z[1]) <= 4:
    print("Dentro del círculo")
    print("Norma de z = ", Norma(z[0],z[1]))

z = (4.2,0.2)
if Norma(z[0],z[1]) <= 4:
    print("Dentro del círculo")
print("Norma de z = ", Norma(z[0],z[1]))

z = (4.2, 0.2)
if Norma(z[0],z[1]) <= 4:
    print("Dentro del círculo")
else:
    print("Fuera del círculo")

z = (4.2, 0.2)
if Norma(z[0],z[1]) <= 4:
    print("Dentro del círculo")
else:
    print("Fuera del círculo")
    print("A una distancia de", Norma(z[0],z[1])-4)



def DentroCirculo(z, r=4):
    if len(z)==2:
        if Norma(z[0],z[1]) <= r:
            print("Dentro del círculo")
        else:
            print("Fuera del círculo, a una distancia de",
            Norma(z[0],z[1])-r,"unidades")
    else:
        print("La longitud de",z,"no es dos")
    return None

z = (3.2,0.2)
if Norma(z[0],z[1]) <= 4:
    if Norma(z[0],z[1]) >= 2:
        print("Dentro del anillo")
    else:
        print("Fuera del anillo")
else:
    print("Fuera del anillo")

if Norma(z[0],z[1]) >= 2 and Norma(z[0],z[1]) <= 4:
    print("Dentro del anillo")
else:
    print("Fuera del anillo")

if  2 <= Norma(z[0],z[1]) <= 4:
    print("Dentro del anillo")
else:
    print("Fuera del anillo")

def DentroAnillo(z, r2 = 4,r1 = 2):
    if len(z)==2:
        if  r1 <= Norma(z[0],z[1]) <= r2:
            print("Dentro del anillo")
        else:
            print("Fuera del anillo")
    else:
        print("La longitud de",z,"no es dos")
    return None

z = (1.4,.5)
if z[0]**2-3 < z[1] <  abs(z[0]):
    print("Capturado")
else:
    print("Libre")

def EntreDosCurvas(z, f, g):
    if len(z)==2:
        if g(z[0]) < z[1] < f(z[0]):
            print("Capturado")
        else:
            print("Libre")
    else:
            print("La longitud de",z,"no es dos")
    return None


if abs(z[0])< 4 and abs(y[0])< 4:    #¿z está dentro del tablero?
    if y > 0:                      #¿z está por encima del eje x?
        if x > 0:                #¿z está a la derecha del eje y?
            print("Blanco")
        else:
            print("Negro")
    else:
        if x > 0:
            print("Negro")
        else:
            print("Blanco")
else:
    print("Fuera del tablero")

def Ajedrez22(z):
    if len(z)==2:
        if abs(z[0])< 4 and abs(z[1])< 4:
            if z[1]*z[0] > 0:
                print("Blanco")
            else:
                print("Negro")
        else:
            print("Fuera del tablero")
    else:
            print("La longitud de",z,"no es dos")
    return None


def signo(x):
    return x and (1-2*(x<0))


def Ajedrez44(z):
    if len(z)==2:
        x, y = z
        if abs(x)< 4 and abs(y)< 4:
            x -= 2*signo(x)
            y -= 2*signo(y)
            Ajedrez22((2*x,2*y))
        else:
            print("Fuera del tablero")
    else:
        print("La longitud de",z,"no es dos")
    return None


def Ajedrez88(z):
    if len(z)==2:
        x, y = z
        if abs(x)< 4 and abs(y)< 4:
            x -= 2*signo(x)
            y -= 2*signo(y)
            Ajedrez44((2*x,2*y))
        else:
            print("Fuera del tablero")
    else:
        print("La longitud de",z,"no es dos")
    return None


def Ajedrez(z, tam = 8):
    if len(z)==2:
        tam /= 2
        if abs(z[0])< tam and abs(z[1])< tam:
            if (int(z[0]+tam)+int(z[1]+tam))%2 == 0:
                print("Blanco")
            else:
                print("Negro")
        else:
            print("Fuera del tablero")
    else:
        print("La longitud de",z,"no es dos")
    return None


Ajedrez((3.2/4,1.2/4),2) # Produce el mismo resultado que
                         # Ajedrez22((3.2,-1.2))
Ajedrez((3.2/2,-1.2/2,4) # Produce el mismo resultado que
                         # Ajedrez44((3.2,-1.2))


"Dentro del anillo" if 2<= Norma((1.42,-1.42)) <= 4 else \
"Fuera del anillo"

##################################################
### Declaraciones `if-elif-else`
##################################################


def h(x):
    if 0 <= x < 1:      # primera condición
        return x        # bloque para la primera condición
    elif 1 <= x < 2:    # segunda condición
        return 2 - x    # bloque para la segunda condición
    else:
        return 0.0      # bloque para cuando no se cumplen ni
                        # la primera ni la segunda condición


def h(x):
    if x < 0:            # primera condición
        return 0.0       # bloque para la primera condición
    elif 0 <= x < 1:     # segunda condición
        return x         # bloque para la segunda condición
    elif 1 <= x < 2:     # tercera condición
        return 2-x       # bloque para la tercera condición
    else:
        return 0.0       # bloque para cuando no se cumplen las
                         # tres condiciones anteriores


##################################################
### Excepciones
##################################################


def inv(x):
    try:
        return 1/x
    except:
        print("La función 1/x no está definida para 0")


def inv(x):
    if x==0:
        print("La función 1/x no está definida para 0")
    else:
        return 1/x


import os
try:
    archivo = open('/Data/Prog/prueba.txt')
    a = archivo.read()
    print(a)
    archivo.close()
except:
    print('No se pudo leer el archivo')


with open('/Data/Prog/prueba.txt') as archivo:
    a = archivo.read()
    print(a)


import urllib
archivo = 'LCT.txt'
paginaD = 'Datos/'
with urllib.request.urlopen(paginaD+archivo) as respuestaURL:
   pagina = respuestaURL.read()
