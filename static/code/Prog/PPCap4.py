#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr 12 12:36:45 2020
@author:
"""
##################################################
### NumPy
##################################################

import math
import matplotlib as mpl
import matplotlib.pyplot as plt
from sympy import *
Pol=np.polynomial.Polynomial
plt.rcParams['font.family'] = 'serif'
plt.rcParams['figure.figsize'] = (8.0, 8.0)
plt.rcParams['font.size'] = 18
mpl.rcParams['mathtext.fontset'] = 'cm'
mpl.rcParams['mathtext.rm'] = 'serif'
plt.rcParams['lines.markersize']=10

##################################################
### Arreglos `NumPy`
##################################################

import numpy as np
numeros_1al8 = range(1,9)
enteros8bytes = np.array(numeros_1al8)
enteros4bytes = np.array(numeros_1al8,dtype='int32')
enteros2bytes = np.array(numeros_1al8,dtype='int16')
enteros1byte  = np.array(numeros_1al8,dtype='int8')
MatrizEnteros8bytes = np.array([numeros_1al8,numeros_1al8,
                                numeros_1al8])

complejos8bytes = np.array(numeros_1al8, dtype='complex64')
complejos16bytes = np.array(numeros_1al8, dtype='complex128')
complejos32bytes = np.array(numeros_1al8, dtype='complex256')

enteros8bytes = np.array(enteros8bytes, dtype='float64')
enteros8bytes.astype('float64')

enteros8bytes.shape
MatrizEnteros8bytes.shape
np.array(np.pi).shape
np.array([np.pi]).shape

enteros8bytes.reshape(8,1)
enteros8bytes.reshape(2,4)
enteros8bytes.reshape(4,2)
enteros8bytes.reshape(2,2,2)

enteros8bytes.reshape((4,2),order='F')

P = np.ones((7,7)) + np.diag(np.arange(10,71,10))

P = [[ 1 for j in range(7)] for i in range(7)]
for i in range(7):
    P[i][i] = (i+1)*10 +1

x1 = np.linspace(0.0, 0.6)
ysm = Vsm(x1)
x2 = np.linspace(0.0, 0.5)
ycs = Vcs(x2)


f, (ax1, ax2) = plt.subplots(1, 2)
ax1.plot(x1, ysm, 'o-',color='black')
ax1.set_ylabel(r'Volumen molar del agua $cm^3$')
ax1.set_xlabel(r'Sulfato de magnesio (mol kg$^{-1})$')
ax1.set_ylim(1001,1012)
ax2.plot(x2, ycs, '-',color='black')
ax2.set_xlabel(r'Cloruro de sodio (mol kg$^{-1})$')
ax2.set_ylim(1001,1012)

np.arange(-2*np.pi,-2*np.pi+26*.5,.5)

import matplotlib.pyplot as plt

# Partición del eje X en intervalos de longitud .5
puntosEnX = np.arange(-2*np.pi,2*np.pi,.5)
# Partición del eje Y en 10 intervalos de igual longitud
puntosEnY = np.linspace(0,4*np.pi,11)
# Malla
xs, ys = np.meshgrid(puntosEnX,puntosEnY)
# Cálculo de la función sen(x)+cos(x)
f_eval = np.sin(xs) + np.cos(ys)
fig = plt.figure(figsize=(10,10))
# Contornos de la función
plt.contourf(puntosEnX,puntosEnY,f_eval,cmap='gray')
plt.colorbar()

import matplotlib.pyplot as plt
np.random.seed(0)
plt.scatter(np.random.rand(100,1),np.random.rand(100,1), c='k')
plt.xlabel(r'$X$')
plt.ylabel(r'$Y$')

DistC  = np.fromfunction( lambda i,j: abs(i-j), (5,5),dtype=int)

##################################################
### Problemas centrales
##################################################


def JuegoVidaV0(B):
    n, m = np.array(B).shape
    Bt = np.zeros((n,m))
    for i in range(1, n-1):
        for j in range(1,m-1):
            vecinas = (B[i-1,j-1] + B[i,j-1] + B[i+1,j-1]+\
                       B[i-1,j]   +            B[i+1,j]  +\
                       B[i-1,j+1] + B[i,j+1]+ B[i+1,j+1])
            if (B[i,j]==0) & (vecinas == 3):
                Bt[i,j]= 1
            elif (B[i,j]==1) & ((vecinas == 3)|(vecinas == 2)):
                Bt[i,j] = 1
    return(Bt)


import math
def VMC0(X):
    if type(X) !=np.ndarray:
        X = np.array(X)
    n, p = X.shape
    D = np.zeros((n,n))
    for i in range(n):
        for j in range(n):
            if i != j:
                D[i,j] = math.sqrt(sum([(x-y)**2\
                for x,y in zip(X[i,],X[j,])]))
            else:
                D[i,i] = np.inf
    return D



##################################################
### Eliminación de ciclos `for`
##################################################


temperaturasF = np.random.uniform(20,90,(100000,1))
temperaturasC = [(x-32)/1.8 for x in temperaturasF]

temperaturasCN = (temperaturasF-32)/1.8

%timeit [(x-32)/1.8 for x in temperaturasF]
%timeit (temperaturasF-32)/1.8

import math
np.random.seed(0)
n = 100000
# Coordenadas cartesianas
X = np.random.random((n,1))
Y = np.random.random((n,1))


r = [math.sqrt(i**2+j**2) for i,j in zip(X,Y)]
theta = [math.atan2(i,j) for i,j in zip(X,Y)]

rN = np.sqrt(X**2+Y**2)
thetaN = np.arctan2(Y,X)


plt.subplot(1, 2, 1)
plt.hist(rN)
plt.subplot(1, 2, 2)
plt.hist(thetaN)


%timeit [math.sqrt(i**2+j**2) for i,j in zip(X,Y)]
%timeit np.sqrt(X**2+Y**2)

#######################
### Agregaciones
#######################

%timeit min(temperaturasF)
%timeit np.min(temperaturasF)

X0 = 2*np.random.rand(100000,2)-1
piEstimado = 4*np.mean( (X0**2).sum(axis=1) < 1)

c = (1/np.arange(1,101)).sum()
p_i = 1/(c*np.arange(1,101))

def NumeroHill(p,q):
    return ((p**q).sum())**(1/(1-q))

def NumeroHill_1(p):
    return np.exp(-((p*np.log(p)).sum()))

qs = np.linspace(0, 3, 301)
Dq = np.zeros(len(qs))
Dq[qs != 1] = NumeroHill(p_i, qs[qs != 1])    # Produce un error

a = np.random.uniform(0,100,(100,200))
a. mean()
a.mean(axis=0)       # promedio por columnas
a.mean(axis=1)       # promedio por filas


#######################
### Broadcasting
#######################

a = np.array([1,2,3,4])
b = np.fromfunction(lambda i,j: i*10+j+1,(3,4))
c = np.array(-1)
d = np.fromfunction(lambda i,j: (-i*10),(3,1))

a**b
a - c
a + d
b*d

d = np.fromfunction(lambda i,j: (-j*10),(1,3))

X = np.random.uniform(0,100,(10,2))
X_Estandarizada =  (X - X.mean(axis=0))/X.std(axis=0)

XBroad, XMediasBroad = np.broadcast_arrays(X,X.mean(axis=0))

X0 = np.random.rand(10,2)
Y  = np.array([-1,1])
Z = X0 + Y[:,np.newaxis, np.newaxis]

X0Broad, YBroad = np.broadcast_arrays(X0,\
                       Y[:,np.newaxis, np.newaxis])
X0Broad.strides
YBroad.strides


#######################
### Indexación
#######################

a = np.array([2, 3.5, -2, -4.5, 4, 5, -3.5, 17] )
mascara = [True, False, False, True, True, False, False, True]
a[mascara]

a[a > 0]
a[a**2 < 16]

a[ abs(a - np.mean(a)) > 2*np.std(a) ] = np.median(a)

P = np.zeros((7,7))
P[1:-1,1:-1] =  1
P[2:-2,2:-2] =  2
P[3:-3,3:-3] =  3


def matrizPiramide(n=3):
    P = np.zeros((2*n+1,2*n+1),dtype="int")
    for i in range(1,n+1):
        P[i:-i,i:-i] = i
    return(P)

a = np.random.randint(1,10,(5,5))
a[ range(5), range(4,-1,-1)]

P[P> 1-epsilon ] = 1-epsilon
P[P<epsilon] = epsilon

sumaXfila = P.sum(axis=1)
sumaXfila.shape

sumaXfilas[:, np.newaxis]

def probTotalAcotada(P, epsilon):
    P[ P > 1-epsilon ] = 1-epsilon
    P[ P < epsilon ] = epsilon
    sumaXfila = P.sum(axis=1)
    P = P / sumaXfila[:, np.newaxis]
    return P

def NumeroHillv2(p,qs=np.linspace(0,3,301)):
    sumaPq = (p[:,np.newaxis]**qs[np.newaxis,:]).sum(axis=0)
    numerosHill = np.full(len(qs), NumeroHill_1(p))
    numerosHill[qs != 1] = sumaPq[qs!=1]**(1/(1-qs[qs != 1]))
    return numerosHill

##############################################
### Ejemplos adicionales
##############################################


orbitas = np.zeros((4,31))
ValoresC = np.array([.2,-1.38,.3,-1.9])

def fc(z,c):
    return z**2 + c

for i in range(1,31):
    orbitas[:,i] = fc(orbitas[:,i-1],ValoresC)

for i in range(4):
    plt.subplot(2, 2, i+1)
    plt.plot(range(31), orbitas[i,], 'ko-')
    plt.xlabel('Iteración')
    plt.ylim(-3,3)
    plt.text(18,-2.5,r'$c=$'+str(ValoresC[i])+r'$+0i$')

def mandelbrot(npixels = 500, iteracionesMax = 20):
    # Crea una malla de tamaño npixels X npixels
    # en los intervalos [-2,1] y [-1.5,1.5]
    x, y = np.meshgrid(np.linspace(-2, 1, npixels),
                       np.linspace(-1.5, 1.5, npixels))
    c = x + 1j * y
    z = c.copy()
    m = np.zeros((npixels, npixels))
    for k in range(iteracionesMax):
        # Índices de los puntos en la malla tal
        # que el módulo de z_k  es menor que 10
        indices = np.abs(z) <= 10
        # Siguiente puntos en la órbita
        z[indices] = z[indices] ** 2 + c[indices]
        m[indices] = k
    return m


M = mandelbrot(iteracionesMax=200)

fig, ax = plt.subplots(1, 1, figsize=(10, 10))
ax.imshow(200-M, cmap=plt.cm.gray)
ax.set_axis_off()

fig, ax = plt.subplots(1, 1, figsize=(10, 10))
ax.imshow(np.log(M), cmap=plt.cm.gray)
ax.set_axis_off()


fig, ax = plt.subplots(1, 1, figsize=(10, 10))
ax.imshow(np.log(M), cmap=plt.cm.hot)
ax.set_axis_off()


identificador = 4*estado[:-2] + 2*estado[1:-1] + estado[2:]

regla = np.array([0,1,1,1,1,0,0,0])
estado = regla[identificador]


def WolframRegla(numero=30, iteraciones=30):
    nCA = 60                 # Ancho de la matriz de salida
    if nCA < iteraciones:
        nCA = 2*iteraciones  # Una mejor visualización
    # obtención de la regla
    regla = list(map(int,list(format(numero,'010b'))))
    regla.reverse()
    regla = np.array(regla)
    # inicialización matriz de salida
    salida = np.zeros((iteraciones+1,nCA),dtype='int8')
    salida[0,nCA//2] = 1
    # ciclo con el número de iteraciones deseadas
    for i in range(iteraciones):
        salida[i+1,1:-1] = regla[salida[i,:-2]*4+\
                                 salida[i,1:-1]*2+salida[i,2:]]
    return salida


def NuevaGeneracion(Actual):
    # Cálculo de vecinos
    V = (Actual[0:-2,0:-2]+Actual[0:-2,1:-1]+Actual[0:-2,2:]+
         Actual[1:-1,0:-2]+                  Actual[1:-1,2:]+
         Actual[2:  ,0:-2]+Actual[2:  ,1:-1]+Actual[2:  ,2:])
    # Reglas
    # Tres vecinos y celda vacía
    nacimientos = (Actual[1:-1,1:-1]==0) &  (V==3)
    # Dos o tres vecinos y célula viva
    sobreviven = ((V==2) | (V==3)) & (Actual[1:-1,1:-1]==1)
    # Nuevos estados. Por defecto célula muerta
    Actual.fill(0)
    # Asigna el valor 1 a las celdas donde hubo nacimientos o
    # donde la célula sobrevivió
    Actual[1:-1,1:-1][nacimientos | sobreviven] = 1
    return Actual


pulsar = np.zeros((17,17),dtype='int8')
filasVivas = [2,4,5,6,7,9,10,11,12,14]
columnasVivas = [[4,5,6,10,11,12],
                 [2,7,9,14],
                 [2,7,9,14],
                 [2,7,9,14],
                 [4,5,6,10,11,12],
                 [4,5,6,10,11,12],
                 [2,7,9,14],
                 [2,7,9,14],
                 [2,7,9,14],
                 [4,5,6,10,11,12]]
for i in range(len(filasVivas)):
    pulsar[filasVivas[i],columnasVivas[i]] = 1
glider = np.zeros((12,12),dtype='int8')
glider[1:4,3] = 1
glider[2,1] = 1
glider[3,2] = 1


def bordes(M,k):
    tam = M.shape[0]
    vTam = tam + k
    V = np.zeros((tam+2*k,tam+2*k),dtype='int8')
    V[k:vTam,k:vTam] = M
    # Bordes izquierdo y derecho
    V[k:vTam,0:k] = M[:,-k:]
    V[k:vTam,-k:] = M[:,:k]
    # Bordes superior e inferior
    V[0:k,k:vTam] = M[-k:,:]
    V[-k:,k:vTam] = M[:k,:]
    # Esquinas
    V[:k,:k]   = M[-k:,-k:]
    V[-k:,-k:] = M[:k,:k]
    V[-k:,:k]  = M[:k,-k:]
    V[:k,-k:]  = M[-k:,:k]
    return V


def conteoAct(M):
    V = (M[0:-2,0:-2]+M[0:-2,1:-1]+M[0:-2,2:]+
         M[1:-1,0:-2]+M[1:-1,1:-1]+M[1:-1,2:]+
         M[2:  ,0:-2]+M[2:  ,1:-1]+M[2:  ,2:])
    return(V)

def conteoInh(M, k):
    m = M.shape[0]
    n = m - 2*k
    V = np.zeros((n,n))
    for i in range(k,(m-k)):
        for j in range(k,(m-k)):
            V[i-k,j-k] = np.sum(M[(i-k):(i+k+1),(j-k):(j+k+1)])
    return V

def leopardo(P, inh = 6, wa = 1, wi= 0.1):
    k1 = inh-1
    Ve = bordes(P, inh)
    I = conteoInh(Ve,inh)
    A = conteoAct(Ve[k1:-k1,k1:-k1])
    Pnueva = np.zeros(P.shape)
    Pnueva[ (wa*A >  wi*I)]=1
    return Pnueva


def distEuclidiana(X):
    n, p = X.shape
    diferencias = X.reshape(n,1,p) - X
    distancias =  (diferencias**2).sum(axis=2)
    np.fill_diagonal(distancias, np.Inf)
    return distancias


def VMC(X):
    distancias = distEuclidiana(X)
    k = np.argmin(distancias,0)
    return X[k,:]


from matplotlib.collections import LineCollection

# Arreglo con 200 puntos aleatorios en R^2
X = np.random.random((200,2))
# Vecinos más cercanos
vecinos = VMC(X)
# Coordenadas de los puntos y su vecino más cercano
coordenadas = np.zeros((200,2,2))
coordenadas[:,0,:] = X
coordenadas[:,1,:] = vecinos
lineas = LineCollection(coordenadas)
fig, ax = plt.subplots(1,1,figsize = (10, 10))
ax.scatter(X[:,0], X[:,1], c = 'black')
ax.add_artist(lineas)


ys = np.mean(np.sort(X,axis=0),axis=1)


def rangos(x):
    n = len(x)
    orden =  x.argsort()
    rango = np.arange(n,dtype='int')
    rango[orden] = np.arange(n)
    return rango


def normCuantilica0(X):
    r = np.apply_along_axis(rangos,0,X)
    ys = np.mean(np.sort(X,axis=0),axis=1)
    z = ys[r]
    return z
X0 = np.array([[1, 6, 4, 3], [2, 5, 7, 5],
               [3, 4, 1, 5],[4, 3, 6, 4],
               [5, 2, 2, 5],[6, 1, 8, 8]])
normCuantilica0(X0)


def empatesM(x):
    u = np.unique(x)
    return len(u)<len(x)


def empates(x):
    u, pos,conteos = np.unique(x,return_inverse=True,
                               return_counts=True)
    return pos, conteos


def normCuantilica(X):
    r  = np.apply_along_axis(rangos,0,X)
    ys = np.mean(np.sort(X,axis=0),axis=1)
    z = ys[r]
    colEmpates = np.apply_along_axis(empatesM,0,X)
    if sum(colEmpates) > 0:
        for i in np.arange(len(colEmpates))[colEmpates]:
            posEmp, conEmp = empates(X[:,i])
            ysEmp = np.bincount(posEmp, z[:,i])/conEmp
            z[:,i] = ysEmp[posEmp]
    return z
normCuantilica(X0)


X = -np.log(np.random.random((200,2)))
Z = normCuantilica(X)

##################################################
### Álgebra lineal
##################################################

from numpy import linalg as nl
A = np.array([[0.9,0.3,0.1],[0.1,0.5,0.2],[0.0,0.2,0.7]])
L = np.fromfunction(lambda x,y: 2+ 3*x - 2*y,(3,2))
R = np.random.randint(-10,11,(3,3))
b = np.array([30.0,25.0,10.0])
D = np.array([[4, 5],[-2, 5]])
E = np.eye(3, k= -1)

5*A
A*R

AR = A.dot(R) # o
AR = A@R
Ab = A.dot(b)  # o
Ab = A@b

M = 3*A@A - A@R.T - 4*E
M@M@M

nl.matrix_power(M,3)

R  = np.array([[1,-1,1],[0,10,25],[20,10,0]])
V  = np.array([0,90,80])
nl.solve(R,V)

nl.inv(R)@V

A = [[2,1,-1],[5, 0, 2], [3,-1, 6]]
Lambda = Symbol('lambda')
Asimb  = Matrix(A)
PolCarac = (Asimb - Lambda*np.eye(3)).det().expand()

Anum = np.array(A)
-nl.matrix_power(Anum,3)+8*nl.matrix_power(Anum,2)-\
                         12*Anum-15*np.eye(3)

val, vec = nl.eig(MatrixCom([-42,-43,28,18,-10,1]))


p0 = np.array([200,100,100,100,200,200,100]).reshape(7,1)
LeslieFocas = np.zeros((6,6))
LeslieFocas = np.diag(Supervivencia[:-1],k=-1)
LeslieFocas[0,] = Fecundidad
p3 = nl.matrix_power(LeslieFocas,3)@p0
sum(p3)

val_prop, vec_prop = nl.eig(LeslieFocas)
abs(val_prop)

##################################################
### Polinomios
##################################################

Pol = np.polynomial.Polynomial
p_gr = Pol([1,1,-1])
p2 = Pol.fromroots([-1 + 1j, -1-1j, 3])

p_gr.roots()
p2.roots()


from sympy import *
h, z, R = symbols('h z R')
integrate(pi*(R**2-z**2), (z, -R, -R+h)).simplify()

R, F  = 200, 200
V0 = 4/3*np.pi*R**3
T  = V0/F
h  = np.zeros(200)
tiempo = np.linspace(0, T, 200)
Coeficientes = [0, 0, 200*np.pi, -np.pi/3]
for i, t in enumerate(tiempo):
    Coeficientes[0] = F*t - V0
    p = Pol(Coeficientes)
    raices = p.roots()
    h[i] = raices[ (0 <= raices) & (raices <= 2*R) ][0]

plt.plot(tiempo/60, h, 'k-')
plt.xlabel('Tiempo (h)')
plt.ylabel('Altura del combustible en el tanque (cm)')


R = 0.08206         # L atm /(mol K)
a = 4.225/1.01325   # L^3 atm/ (mol^2)
b = 0.03707         # L/mol
T1 = 298            # K
P1 = 1              # atm
coeficientes1 = [-a*b, a, -(P1*b+R*T1), P1]
Pol(coeficientes1).roots()
T2 = 500            # K
P2 = 120            # atm
coeficientes2 = [-a*b, a, -(P2*b+R*T2), P2]
Pol(coeficientes2).roots()


def WaalsVM(T, P, a = 4.225/1.01325, b = 0.03713):
    R = 0.08206           # L atm / (mol K)
    Tc = 8*a/(27*b*R)     # K
    Pc = a/(27*b**2)      # atm
    coeficientes = [-a*b, a, -(P*b + R*T), P]
    z = Pol(coeficientes).roots()
    return z, Tc, Pc


def isoterma(V,T = 405, a = 4.225/1.01325, b = 0.03707):
    R = 0.08206       # L atm /(mol K)
    P = (R*T)/(V-b) - a/V**2
    return P
