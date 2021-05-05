#!/usr/bin/env python3
# -*- coding: utf-8 -*-

##################################################
### Introducción
##################################################

import math

math.sin(math.pi/8)

from math import pi,sin
sin(pi/8)

import random as rnd
rnd.randint(0,10)

from random import gauss as n, expovariate as exp
n(0,1) + exp(1)



##################################################
###  Asignaciones y variables
##################################################

x = 9.80665

GravedadEstandar  = 9.80665

NumComplejo = 2.5 + 1.2j
Alfabeto = 'alfabeto'
Aprobacion = True
Pele = 10
Messi = 10 + 0j
James = 10.0

type(Alfabeto)
type(NumComplejo)

print(Pele+Messi)
print(complex(Pele)+Messi)

tasa = 0.05
print(1+tasa)
tasa = 0.02
print(1+tasa)

tasa = 0.01
tasa = tasa + 0.005
tasa = tasa + 0.003
print(tasa)

f"Tres elevado a la 2 es {3**2}"
f"La tasa de interés es {tasa}, pero esta aumentará 10%, es decir, la nueva tasa es {tasa*1.1}"


##################################################
### Cálculos básicos
##################################################

850500*((1+0.02)**2)*45/100

17/3
-17/3
17//3
-17//3

direccion = 'https://wiki.python.org/moin/'
inicio = 'FrontPage'

'A' + 'C' + 'G' + 'T'
print(direccion + inicio)
'etc., ' * 3

x = 3
(5 > x) and (x>4)
(5 > x) or (x>4)
not (x==3)



##################################################
### Cálculos simbólicos
##################################################


from sympy import *
V, R, T, a, b = symbols('V R T a b')
p = (R*T)/(V-b) - a/V**2
dpdV  = diff(p,V)
dpdV2 = diff(p,V,2)

solve(dpdV,T)
solve(dpdV2,T)
solve(solve(dpdV,T)[0]-solve(dpdV2,T)[0],V)[1]

limit((a**2 - b**2)/(a-b), a, b) # Calcula límites
integrate(sen(b), b)             # Integra sen(b)
simplify((a**2 - b**2)/(a+b))    # Simplifica la  expresión

exp_f = a*exp(-a)
f = lambdify([a], exp_f)
f(-1)

##################################################
### Contenedores básicos
##################################################

########################
### Listas
########################

import math
Fechas = ['Oct 01, 2014', 'Oct 24, 1980', 'Feb 11, 2002']
Codigos = [201701092,201801875,201901902,202001802,202100002]
Constantes = [math.pi, math.e, 0.5]
DeTodoUnPoco = ['Casino', 65, 1.3, 2+3j]
SoloNumeros = [[1,2,3], [3.4, 4.5, 5.6], [2+8j,3+27j,4+64j]]
Aprobaron = [True,False,True,True,True,False]

Fechas[0]
SoloNumeros[2][1]
DeTodoUnPoco[-1]


# Primeros cuatro elementos
Codigos[0:4]
Codigos[:4]
# Dos últimos elementos
Codigos[3:5]
Codigos[3:]
Codigos[-2:5]
Codigos[-2:]
# Tercer y cuarto elemento
Codigos[2:4]
Codigos[-3:-1]

Constantes[2]=0

# Insertar el número aúreo en la segunda posición de la lista:
Constantes.insert(1,(1+math.sqrt(5))/2)
# Adicionar la raíz cuadradda de 2 al final de la lista
# `Constantes`:
Constantes.append(math.sqrt(2))
# Ordenar la lista
Constantes.sort()
# Revertir el orden de la lista
Constantes.reverse()

Constantes.__len__()

0 in Constantes
del Constantes[3]

Constantes + 3*[1, 10, 100]

secuencia = 'PpRrOoGgRrAaMmCcIiOoNn'
secuencia[::2]


a = [1,2]
b = a
print(a)
print(b)
a[1] = 4
print(a)
print(b)

########################
### Tuplas
########################

NucleotidosADN = ('A', 'C', 'G', 'T')
# Número de unidades de valor tributario (UVT) exentas para
# pago de renta según el sistema de rentas cedulares:
UVTexemptas = (1090, 1700, 600, 600)

NucleotidosADN[0] = 'U' # Error: el objeto tupla no soporta
                        # la asignación
NucleotidosADN.sort()   # Error: un objeto tupla no tiene el
                        # atributo `sort`


# Lista de números en el plano cartesiano
z = [(2,3),(1,1), (4,7), (1.5,3.4), (1.34,3.41), (2.2,3.2),(0.2, -0.5)]
# Cálculo de |x| + |y| para el último elemento de z
abs(z[-1][0])+abs(z[-1][1])


########################
### Conjuntos
########################


M = set("Marie Curie")
C = set("Carl Gauss")
print(M&C)
print(M|C)
print(M^C)


########################
### Diccionarios
########################

codigoGenetico={'ATT':'I',   'ATC':'I',  'ATA':'I',  'CTT':'L',
'CTC':'L',  'CTA':'L',  'CTG':'L',  'TTA':'L',  'TTG':'L',
'GTT':'V',  'GTC':'V',  'GTA':'V',  'GTG':'V',  'TTT':'F',
'TTC':'F',  'ATG':'M',  'TGT':'C',  'TGC':'C',  'GCT':'A',
'GCC':'A',  'GCA':'A',  'GCG':'A',  'GGT':'G',  'GGC':'G',
'GGA':'G',  'GGG':'G',  'CCT':'P',  'CCC':'P',  'CCA':'P',
'CCG':'P',  'ACT':'T',  'ACC':'T',  'ACA':'T',  'ACG':'T',
'TCT':'S',  'TCC':'S',  'TCA':'S',  'TCG':'S',  'AGT':'S',
'AGC':'S',  'TAT':'Y',  'TAC':'Y',  'TGG':'W',  'CAA':'Q',
'CAG':'Q',  'AAT':'N',  'AAC':'N',  'CAT':'H',  'CAC':'H',
'GAA':'E',  'GAG':'E',  'GAT':'D',  'GAC':'D',  'AAA':'K',
'AAG':'K',  'CGT':'R',  'CGC':'R',  'CGA':'R',  'CGG':'R',
'AGA':'R',  'AGG':'R',  'TAA':'X',  'TAG':'X',  'TGA':'X'}
list(codigoGenetico.values()).count('L')

codigoGenetico['AAA']

nucleotidosADN = 'ACGT'
codon = 'CAT'
print(codigoGenetico[codon[0]+nucleotidosADN[0]+codon[2]])
print(codigoGenetico[codon[0]+nucleotidosADN[1]+codon[2]])
print(codigoGenetico[codon[0]+nucleotidosADN[2]+codon[2]])
print(codigoGenetico[codon[0]+nucleotidosADN[3]+codon[2]])

p1 = {6:4, 2:34, 0:-6}

##################################################
### Funciones
##################################################

def g(z):
    return abs(z[0]) + abs(z[1])

a = g((1,-1))
b = g([0,-1])

def hmsdec(h,m,s):
    return 15*(h + m/60 + s/3600)

def gmsdec(g,m,s,P):
    return P*(abs(g) + m/60 + s/3600)

gmsdec(-5,31,12,-1)

def Vsm(m):
    return 1001.38-4.86*m+34.69*m**2

def Vcs(n):
    return 1003.0+16.4*n+2.1*n**(3/2)+0.003*n**(5/2)

def Vsp(m):
    return 17.963-0.1094*m**(3/2)-0.0002*m**2

Vsp(0.10)

x, x0, gamma= symbols('x x0 gamma')
f = gamma/(pi*(gamma**2+(x-x0)**2))
dfdx = diff(f,x)
dfdx2 = diff(f,x,2)
solve(dfdx,x)


solve(f-(1/(2*pi*gamma)),x)

##################################################
### Figura 1.2
##################################################

import numpy as np
import matplotlib.pyplot as plt
def Cauchy(x,x0,gamma):
    return gamma/(np.pi*(gamma**2+(x-x0)**2))

j = Cauchy(75,75,50)/2

xs = np.linspace(-75,225,200)
plt.plot(xs,Cauchy(xs,75,50),c='k')
plt.plot([25,74],[j,j],'k--')
plt.plot([76,125],[j,j],'k--')
plt.plot([25,25],[0,Cauchy(25,75,50)],'k:')
plt.plot([125,125],[0,Cauchy(125,75,50)],'k:')
plt.plot([75,75],[0,Cauchy(75,75,50)],'k:')
plt.ylim(0,0.0065)
plt.xlabel(r'$x$')
plt.ylabel(r'$f_X(x|50,75)$')
plt.text(65,j+.00005,r'$\Gamma$')
plt.text(62,.0001,r'$x_0$')
plt.text(12,.0001,r'$x_1$')
plt.text(112,.0001,r'$x_2$')



def BreitWigner(e,Er,Gamma):
    return (Gamma/(2*math.pi))/((e-Er)**2+Gamma**2/4)


def InterpolLinLagrange(x, xObs, yObs):
    """
    Interpolación lineal usando el método de Lagrange en
    el punto x.

    xObs: valores de los puntos en x
    yObs: valores de los puntos en y

    Ejemplo:
    >>> InterpolLinLagrange(0.5, (-1,1), (-1,1) )
    >>> InterpolLinLagrange(20, [18,25], [7,6] )
    """

    l0 = (x-xObs[1])/(xObs[0]-xObs[1])
    l1 = (x-xObs[0])/(xObs[1]-xObs[0])
    return yObs[0]*l0 + yObs[1]*l1


def derivadas(f,x,h=0.0001):
    df  = (f(x+h) - f(x-h))/(2.0*h)
    ddf = (f(x+h) - 2.0*f(x) + f(x-h))/h**2
    return df,ddf

DAtan = derivadas(math.atan, 0.6)
DAtan1,DAtan2 = derivadas(math.atan, 0.6, 0.000001)

def f1(x):
    return 1/(x**3 - 2*x**2)
Df1 = derivadas(f1 ,0.4)

Df1 = derivadas(lambda x: 1/(x**3 - 2*x**2) ,0.4)
Df2 = derivadas(lambda x: 1/(3*x**3 - 4*x**2) ,0.4)

Norma = lambda x , y: math.sqrt(x**2 + y**2)
Norma(4,3)


##################################################
### Variables locales y globales
##################################################


def ValorFuturo(V0, t=1, r=0.05):
  FactorCrecimiento = pow(1+r,t)
  return V0*FactorCrecimiento

r0, t0 = 0.05, 2
vf1 = ValorFuturo(100, t0, r0)
print(FactorCrecimiento)

def f2(r1):
    V0 = 200
    print(ValorFuturo(100,t0,r1))
    print(ValorFuturo(100,t0,r0))
    print(V0)
    return None

def parteEnteraL1(z):
    return abs(z.imag)+abs(z.real)

def PC1(z):
    print(parteEnteraL1(z[0]), parteEnteraL1(z[1]),
          parteEnteraL1(z[2]))
    print(int(abs(z[-3])),int(abs(z[-2])),int(abs(z[-1])))
    return None

##################################################
### Visualización básica
##################################################


from matplotlib import pyplot as plt
plt.rcParams['font.family'] = 'serif'
plt.rcParams['figure.figsize'] = (10.0, 8.0)
plt.rcParams['font.size'] = 18

figura1 = plt.figure()
print(figura1)

figura2 = plt.figure(figsize=(6, 4), facecolor='white')
print(figura2)

x1 = [0, 1, 2, 3, 4, 5]
x2 = [0.2, 0.8, 1.6, 2.5, 3.6, 4.8]
y1 = [10, 20, 25, 30, 25, 20]
y2 = [5, 15, 25, 25, 28,30]
figura3 = plt.figure()
ax = figura3.add_subplot(111)
ax.plot(x1, y1 , color='gray', linewidth=3, linestyle='dashed')
ax.scatter(x2, y2, color='black', marker='*')
ax.set_xlim(-0.5, 5.5)
plt.show()


plt.plot(x1, y1, color='gray', linewidth=3, linestyle='dashed')
plt.scatter(x2, y2, color='black', marker='*')
plt.xlim(-0.5, 5.5)
plt.show()




##################################################
### Focas grises
##################################################


Edad = [0, 1, 2, 3, 4, 5, 6]
Fecundidad = [0, 0, 0, 0, 0.08, 0.28, 0.42]
Supervivencia = [0.657, 0.93, 0.93, 0.93, 0.935, 0.935, 0]
FocaGris = plt.figure()
ax = FocaGris.add_subplot(111)
ax.plot(Edad, Fecundidad, marker='+', markersize=12, lw=2,
        color = 'black', linestyle = 'dashed', mfc='black',
        mec='black', label='Fecundidad')
ax.plot(Edad, Supervivencia, marker='.', markersize=12, lw=2,
        color = 'gray', linestyle = 'dotted', mfc='gray',
        mec='gray',label ='Supervivencia')
ax.set_ylim([-.1,1])
ax.set_xlabel('Edad')
ax.set_ylabel('Tasa')
# Adiciona la legenda en el centro abajo
ax.legend(loc='upper center',
          bbox_to_anchor=(0.5, -.15), shadow=True, ncol=2)


from matplotlib import style         # Importar `style`
style.use("seaborn-white")           # Escoger estilo
plt.plot(Edad, Fecundidad, 'k+:', label='Fecundidad' )
plt.plot(Edad, Supervivencia, 'k+--', label ='Supervivencia')
plt.xlabel('Edad')
plt.ylabel('Tasa')
plt.ylim([-.1,1])
plt.legend(loc='upper center',
          bbox_to_anchor=(0.5, -.15), shadow=True, ncol=2)




##################################################
### Casos de COVID-19 a Marzo 29,2020
##################################################


Pais = ['E.E.U.U.', 'Italia', 'China','España','Alemania',
        'Francia','Iran', 'G.B.','Suiza','Holanda']
Casos = [123780, 92472, 81439, 73235, 58247, 37575, 35408, 17089, 14076, 9762]
Recuperados = [3238, 12384, 75448, 12285, 8481, 5700, 11679, 135, 1595, 3]

from matplotlib import style         # Importar `style`
style.use("fivethirtyeight")         # Escoger estilo
COVID = plt.figure(figsize=(6, 8))   # Nueva figura, tamaño 6X8
# Ajustar espacio entre subfiguras
COVID.subplots_adjust(hspace=0.4, wspace=0.4)
ax1 = COVID.add_subplot(211)         # Adicionar un subfigura
ax1.bar(Pais,Casos, color="gray")    # Adicionar barras
ax1.set_ylabel('Frecuencia')         # Adicionar etiqueta eje Y
ax1.tick_params(axis='x', labelrotation=45)

# Posiciones de las barras
posiciones = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
posiciones2 = [1.45, 2.45, 3.45, 4.45, 5.45, 6.45, 7.45, 8.45, 9.45, 10.45]

style.use("seaborn-dark-palette")
ax2 = COVID.add_subplot(212)
ax2.bar(posiciones, Casos, 0.45, color ="dimgray",\
        label="Casos positivos")
ax2.bar(posiciones2, Recuperados,0.45, color="darkgray",\
        label="Recuperados")
ax2.set_xticks(posiciones2)
ax2.set_xticklabels(Pais)
ax2.set_xlabel('País')
ax2.set_ylabel('Frecuencia')
ax2.legend()
ax2.tick_params(axis='x', labelrotation=45)

plt.style.available

##################################################
### Problema Plano cartesiano
##################################################

import math
from matplotlib import pyplot as plt
from matplotlib import style

def PC1(z):
    print(int(Norma(z[0][0],z[1][0])),
          int(Norma(z[0][1],z[1][1])),
          int(Norma(z[0][2],z[1][2])))
    print(g((z[0][-3],z[1][-3])),g((z[0][-2],z[1][-2])),
          g((z[0][-1],z[1][-1])))
    style.use("ggplot")
    plt.scatter(z[0],z[1],color="black")
    plt.xlabel("X")
    plt.ylabel("Y")
    plt.show()



a = [(2, 1, 4, 1.5, 2, 4, 3, 1, 5, 1.34, 2.2, 0.2),
     (3, 1, 7, 3.4, 7, -2, 3, 2.3, 4.5, 3.41, -3.2, -.5)]
PC1(a)


PC1([(1, 2, 3),(1, 3)])
PC1([(1, 2),(1, 3)])
PC1([(1, 2),(1, 3),(2, 3)])
PC1([(1, 2, 4, 5),(1, 3, 3)])


import math
from matplotlib import pyplot as plt
from matplotlib import style

def PC1(z):
    if (len(z) != 2) or (len(z[1]) < 3) or (len(z[0]) < 3):
        print("Se necesita una lista con dos elementos y que\
                cada una de las listas tenga más de 3 elementos")
    else:
        print(int(Norma(z[0][0],z[1][0])),
              int(Norma(z[0][1],z[1][1])),
              int(Norma(z[0][2],z[1][2])))
        print(g((z[0][-3],z[1][-3])),g((z[0][-2],z[1][-2])),
              g((z[0][-1],z[1][-1])))
        if (len(z[1]) == len(z[0])):
            style.use("ggplot")
            plt.scatter(z[0],z[1],color="black")
            plt.xlabel("X")
            plt.ylabel("Y")
            plt.show()
        else:
            print("Tuplas de distinta longitud, no se pueden\
                   graficar los puntos")
    return None
