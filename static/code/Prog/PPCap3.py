#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr 12 20:06:13 2020
@author:
"""

##################################################
### Ciclos
##################################################

import matplotlib as mpl
import matplotlib.pyplot as plt
plt.rcParams['font.family'] = 'serif'
plt.rcParams['figure.figsize'] = (10.0, 10.0)
plt.rcParams['font.size'] = 18

mpl.rcParams['mathtext.fontset'] = 'cm'
mpl.rcParams['mathtext.rm'] = 'serif'

A = [[4. , 3.8, 4. , 4.2, 4. , 3.8, 3.9, 4.1, 4.1],
     [4.4, 4.1, 3.8, 3.9, 4.1, 4.1, 4. , 4.1, 4.2],
     [4.4, 4.6, 4.2, 3.8, 3.9, 4.1, 4. , 4.2, 4.5],
     [4.1, 4.3, 4.4, 4.1, 3.8, 3.9, 4.1, 4.1, 4.5],
     [4.1, 4.2, 4.2, 4.2, 4.1, 4.1, 4.3, 4.4, 4.6],
     [4.3, 4.4, 4.3, 4.3, 4.2, 4.1, 4.1, 4.5, 4.9],
     [4.4, 4.2, 4.1, 4.1, 3.8, 3.7, 4. , 4.3, 5.2],
     [4.5, 4.7, 4.5, 4.2, 4.2, 3.8, 4. , 4.5, 5.1],
     [4.3, 4.4, 4.5, 4.5, 4.4, 4.2, 4. , 4.5, 5.3]]

plt.imshow(A, cmap=plt.cm.gray)
plt.axis('off')


########################################################
### Ciclos `for`
########################################################

secuenciaADN = "ACCTTTGTTAACCACACTAG"
frecuencia = [0,0,0,0]      # inicialización de la lista de
                            # frecuencias
for i in secuenciaADN:      # se itera sobre la secuencia de ADN
    if i == "A":            # determinar el tipo de nucleótido
        frecuencia[0] += 1
    elif i == "C":
       frecuencia[1] += 1
    elif i == "G":
       frecuencia[2] += 1
    else:
       frecuencia[3] += 1
print(frecuencia)


def ConteoNucleotidos(S, nucleotidos = 'ACGT'):
    Frecuencias = []
    S = S.upper()
    for n in nucleotidos.upper():
        Frecuencias.append(S.count(n))
    return Frecuencias

ConteoNucleotidos(secuenciaADN)


def ConteoNucleotidosL(S, nucleotidos = 'ACGT'):
    S = S.upper()
    Frecuencias = {}
    for n in nucleotidos.upper():
        Frecuencias[n] = S.count(n)
    return Frecuencias

ConteoNucleotidosL(secuenciaADN)


def multiplicacionListas(lista1,lista2):
    l = []
    suma = 0
    if len(lista1)==len(lista2):
        for i in range(len(lista1)):
            l.append(lista1[i]*lista2[i])
            suma += l[i]
        print("La suma del producto de los elementos es", suma)
    else:
        print("Listas con distintas longitudes")
    return l


def promedioMatriz(matrizOriginal):
    n = len(matrizOriginal)         # número de filas
    m = len(matrizOriginal[0])      # número de columnas
    suma = 0                        # inicialización de la suma
    for i in range(n):
        for j in range(m):
            suma += matrizOriginal[i][j] # suma sobre todo los
                                         # elementos de la lista
    return suma/(n*m)



listaInicial = [2,3.5,-2,-4.5, 4, 5, -3.5,7]
listaRaizCuadrada = [ math.sqrt(abs(i)) for i in listaInicial]

lRaizCuadradaPos = [ math.sqrt(i) for i in listaInicial if i > 0]

lista1 = [3,2,4,7,5]
lista2 = [9,3,4,6,1]
multiplicacion = [i*j for i,j in zip(lista1,lista2)]


def multiplicacionListas(lista1,lista2):
    if len(lista1)==len(lista2):
        l = [i*j for i,j in zip(lista1,lista2)]
        print("La suma del producto de los elementos es", sum(l))
    else:
        print("Listas con distintas longitudes")
        l = None
    return l



[ [ j*i for i in lista1 ] for j in range(1,8)]

promedioA = promedioMatriz(A)
B = [[promedioA for i in range(len(A)+2)] \
      for j in range(len(A[0])+2)]
for i in range(len(A)):
   for j in range(len(A[0])):
      B[i+1][j+1] = A[i][j]


def imagenBorrosa(matOrig):
    n = len(matOrig)
    m = len(matOrig[0])
    promedio = promedioMatriz(matOrig)
    # Inicialización de las matrices B y C
    B = [[promedio for j in range(m+2)] for i in range(n+2)]
    C = [[matOrig[i][j] for j in range(m)] for i in range(n)]
    for i in range(n):            # Creación matriz aumentada
        for j in range(m):
            B[i+1][j+1] = matOrig[i][j]
    for i in range(n):            # Cálculo del filtro
        for j in range(m):
            Bij = [[B[k][l] for k in range(i,i+3)] \
                    for l in range(j,j+3)]
            C[i][j] = promedioMatriz(Bij)
    return(C)


plt.imshow(imagenBorrosa(A), cmap=plt.cm.gray)
plt.axis('off')


def contenidoGC(S, W = 64, salto =32):
    rhos = []
    for k in range(0, len(S), salto):
        conteos = ConteoNucleotidos(S[k:(k+W)])
        cg = conteos[1]+conteos[2]
        rhos.append(cg/(conteos[0]+conteos[3]+cg))
    return rhos

conSeq1 = contenidoGC('TTGACCGATGACCCCGGTTCAGGCTTCACCACAGT',8,4)

import collections
def ConteoNucleotidosC(S, nucleotidos = 'ACGT'):
    Frecuencias = collections.Counter(S)
    Fsel= {n:Frecuencias[n] for n in Frecuencias.keys()\
    & nucleotidos}
    return Fsel

def contenidoGC2(S, W= 64, salto=32):
    return [sum(ConteoNucleotidosC(S[k:(k+W)],'CG').values())\
            /len(S[k:(k+W)]) for k in range(0,len(S),salto)]

conSeq2=contenidoGC2('TTGACCGATGACCCCGGTTCAGGCTTCACCACAGT',8,4)

import os
import urllib
def lecturaGen(archivo):
    if not os.path.isfile(archivo):
        paginaD = 'Datos/'
        direccion = paginaD+archivo
        with urllib.request.urlopen(direccion) as respuestaURL:
            lineas = respuestaURL.readlines()
    else:
        with open(archivo) as archivoLocal:
            lineas = archivoLocal.readlines()
    gen = ''.join([l.strip().decode("utf-8") for l in lineas])
    return gen
LCT = lecturaGen('LCT.txt')

LCT_GC = contenidoGC2(LCT, 1000,500)

##################################################
### Ciclos `while`
##################################################

for i in range(210):
    if (107*i)%210 == 1:
        k = i
print(k)


k = 0
while  (107*k)%210 != 1:
    k += 1
print(k)

def mcd0(a,b):
    minAB = min(a,b)
    maxComDiv = 1
    for x in range(2,minAB+1):
        if b%x == 0 and a%x == 0:
            maxComDiv = x
    return(maxComDiv)

def mcd1(a,b):
    res = a%b
    while res>0:
        a = b
        b = res
        res = a%b
    return(b)

a, b  = b, a%b

def mcd2(a,b):
    while b:
        a, b  = b, a%b
    return(a)

def BusquedaRaiz(f,l,u, h=0.001):
    r = l
    fr = f(r)
    s = r+h
    fs = f(s)
    while signo(fr) == signo(fs):
        if r > u:
            return None
        r = s
        fr = fs
        s = r + h
        fs = f(s)
    else:
        return r,s


interesMensual = lambda r: (1+r)**(-60)+40*r-1
lTasa, uTasa = BusquedaRaiz(interesMensual,0.001,0.02)

def metodoNewton(f, df, r0, epsilon=1e-4):
    delta = abs(0-f(r0))
    while delta > epsilon:
        dfr0 = df(r0)
        if dfr0 == 0:
            print("Derivada igual a cero. Método falla")
        else:
            r0 = r0 - f(r0)/df(r0)
        delta = abs(0-f(r0))
    return r0

d_interesMensual = lambda r: 40 - 60/(1+r)**61

rSolucion = metodoNewton(interesMensual, d_interesMensual,
                         0.014, 1e-5)
print(interesMensual(rSolucion))
