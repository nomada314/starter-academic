#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 20 09:30:37 2020
@author:
"""

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy.linalg as nl
Pol=np.polynomial.Polynomial

##################################################
### Computación científica
##################################################


from scipy.special import gamma
gamma(6) - 5*gamma(5)
gamma(0.5) - np.sqrt(np.pi)


##################################################
### Interpolación
##################################################

BWexp = pd.DataFrame({'Ei':range(0,201,25),
                      'fobs':[10.6, 16.0, 45.0, 83.5, 52.8, 19.9,
                             10.8, 8.25, 4.7],
                     'Error':[ 9.34, 17.9, 41.5, 85.5, 51.5, 21.5,
                               10.8, 6.29, 4.14]})

x = BWexp.values[:,0]
y = BWexp.values[:,1]
PhiX1 = np.vander(x,increasing=True)
c = nl.solve(PhiX1,y)
BWinter1 = Pol(c)

BWinter2 = Pol.fit(x, y, 8)

PCheb = np.polynomial.Chebyshev
BWinter2 = PCheb.fit(x, y, 8)


##################################################
### Interpolación usando splines
##################################################


unos = np.ones(7)
H = 100*np.eye(7) + 25*np.diag(np.ones(6),k=-1)+
    25*np.diag(np.ones(6),k=1)
b = y[:-2] -2*y[1:-1]+y[2:]
c = np.zeros(9)
c[1:8] = nl.solve(H,b)


from scipy.interpolate import interp1d
BWinterS3 = interp1d(x,y,kind='cubic')

##################################################
### Interpolación en dos dimensiones
##################################################

from skimage import io
paginaI = 'Imagenes/'
archivo = 'CircConc.jpg'
Circulos = io.imread(paginaI+archivo, as_gray=True)

x = np.array(range(0,604,3))
y = np.array(range(0,324,3))
xx, yy = np.meshgrid(y,x)
Circulos9  = Circulos[xx,yy]

from scipy.interpolate import interp2d
x1 = np.arange(604)
y1 = np.arange(324)
f = interp2d(x, y, Circulos9.T, kind='cubic')
Z2 = f(x1, y1)


x = range(607)
y = range(324)
px, py = np.random.choice(x, 10000), np.random.choice(y, 10000)
CirculosAleat = Circulos[py,px]

from scipy.interpolate import griddata
X, Y = np.meshgrid(x,y)
CirculosRec = griddata((px, py), CirculosAleat, (X, Y),
                     method='cubic')

##################################################
### Mínimos cuadrados
##################################################

from scipy import stats
audaz_m1 = stats.linregress(AudazM['sperm number (10^6)'],
                            AudazM['Audacia'])
print(f'b_0 = {audaz_m1.intercept}')
print(f'b_1 = {audaz_m1.slope}')


from scipy.optimize import leastsq
def residualesP2(betas, x, y):
    Xbeta = np.vander(x,3)@np.array(betas)
    return y - Xbeta
audaz_m2 = leastsq(residualesP2, [50,5,1],\
                   args=(AudazM['conteo'],\
                         AudazM['Audacia']))


def BreitWignerV2(e, Er,gamma,fr):
    return fr/((e-Er)**2+gamma**2/4)

def residualesBW(p, e, y, error):
    return (y - BreitWignerV2(e,p[0],p[1],p[2]))/error

BW_m1 = leastsq(residualesBW, [75,100,10],\
                   args=(BWexp['Ei'],BWexp['fobs'],1))

BW_m2 = leastsq(residualesBW, [75,100,10],\
                   args=(BWexp['Ei'],\
                         BWexp['fobs'],\
                         BWexp['Error']))


def MMv(s, v, k):
    return v*s/(k+s)

paginaD = 'Datos/'
vmkmki = pd.read_csv(paginaD+'vmkmki.csv')
# solo usamos valores de S mayores que 0
vmkmki = vmkmki.iloc[vmkmki['S']>0,:]
MMV_res = curve_fit(MMv, vmkmki['S'], vmkmki['v'], p0=[10,10])


def MMv2(SI, b1, b2, b3):
    s = SI.iloc[:,0]
    i = SI.iloc[:,1]
    return b1*s/(s + b2*(1+i/b3))

MMV2_res = curve_fit(MMv2, vmkmki[['S','I']], vmkmki['v'],\
                     p0=[10,10,10])


from mpl_toolkits.mplot3d import Axes3D
def MMv2_fig(S,I, b1, b2, b3):
    return b1*S/(S + b2*(1+I/b3))

ii = np.linspace(0, 100, 51)
ss = np.linspace(0, 200, 101)
I,S = np.meshgrid(ii,ss)
Z = MMv2_fig(S,I,18.05582006, 15.21480513, 22.2823522)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.contour3D(X, Y, Z, 100, cmap='binary')
ax.scatter(vmkmki['I'], vmkmki['S'], vmkmki['v'], s=30)
ax.view_init(elev=10., azim=30)
ax.set_xlabel(r'$I$')
ax.set_ylabel(r'$S$')
ax.set_zlabel(r'$V_t$');

##################################################
### Integración
##################################################

lx = np.array([1, 0.8335, 0.7313, 0.5881, 0.4334, 0.2928,\
               0.1813, 0.1029, 0.0535, 0.0255])
mx = np.array([0, 0.6504, 2.3939, 2.9727, 2.4662, 1.7043,\
               1.0815, 0.6683, 0.4286, 0.3000])
def Etopillo(r, l=lx, m=mx):
    return np.sum(l*m*np.exp(-r*np.arange(l.shape[0]))) -1

def dEtopillo(r, l=lx, m=mx):
    x = np.arange(l.shape[0])
    return -np.sum(x*l*m*np.exp(-r*x))

metodoNewton(Etopillo, dEtopillo, .5)


from scipy.optimize import newton
newton(Etopillo, .5, dEtopillo)


def EtopilloTrap(r, l=lx, m=mx):
    i = l*m*np.exp(-r*np.arange(l.shape[0]))
    return np.sum(i[1:-1])+(i[0]+i[-1])/2 - 1

def dEtopilloTrap(r, l=lx, m=mx):
    x = np.arange(l.shape[0])
    d = x*l*m*np.exp(-r*x)
    return -(np.sum(d[1:-1])+(d[0]+d[-1])/2)

newton(EtopilloTrap, .5, dEtopilloTrap)

def EtopilloSimp(r, l=lx, m=mx):
    from scipy.integrate import simps
    return simps(lx*mx*np.exp(r*np.arange(lx.shape[0]))) -1

r= np.array([0, 800, 1200, 1400, 2000, 3000, 3400, 3600, 4000,\
             5000, 5500, 6370])*1000           # Radio en metros
rho=np.array([13, 12.9, 12.7, 12, 11.65, 10.6, 9.9, 5.5, 5.3,\
              4.75, 4.5, 3.3])*1000
simps(4*np.pi*rho*r**2,r)

import scipy.integrate.quadrature as quad
def Debye_int(x):
    return (x**4)*np.exp(x)/(np.exp(x)-1)**2
def Debye_g(u):
    I = quad(Debye_int, 0, 1/u)[0]
    return 3*I*u**3


xs = np.linspace(0,15,101)
us = np.linspace(0.01,1.5,100)
fig, ax= plt.subplots(1,2,figsize=(12,6))
ax[0].plot(xs, Debye_int(xs),'k')
ax[0].set_xlabel(r'$x$')
ax[0].set_ylabel(r'$x^4e^x(e^x-1)^{-2}$')
ax[1].plot(us, [3*Debye_g(u) for u in us], 'k')
ax[1].set_xlabel(r'$T/Td$')
ax[1].set_ylabel(r'$C_v/(3Nk)$')
fig.tight_layout()


def dt(x,nu):
    from scipy.special import gamma
    num = gamma((nu+1)/2)*(1+(x**2)/nu)**(-(nu+1)/2)
    return num/(np.sqrt(nu*np.pi)*gamma(nu/2))


from scipy import integrate
def g_v0(c, param):
    """
    param es una lista con los valores de nu y q
    """
    return integrate.quad(dt,-np.inf, c, args=(param[0]))[0]\
           - param[1]

def BusquedaRaizV2(f,l,u,param,h=0.1):
    r = l
    fr = f(r,param)
    s = r+h
    fs = f(s,param)
    while signo(fr) == signo(fs):
        if r > u:
            return None
        r = s
        fr = fs
        s = r + h
        fs = f(s,param)
    else:
        return r,s

def qt(q,nu, l= -10, u=10):
    from scipy.optimize import bisect
    lu = BusquedaRaizV2(g_v0, l, u, [nu,q])
    return bisect(g_v0,lu[0],lu[1],args=([nu,q]))


qt(.95, 5)

##################################################
### Ecuaciones diferenciales
##################################################


def LV(xy, t, r, beta, gamma, delta):
    x, y = xy
    return [r*x - beta*x*y, gamma*x*y - delta*y]

from scipy.integrate import odeint
NP_0 = [700,300]
t = np.linspace(0, 100, 251)
NP_t = odeint(LV, NP_0, t, args=(0.302, 0.00409, 0.00196, 0.65))


pag0 = 'https://raw.githubusercontent.com/' +\
       'CSSEGISandData/COVID-19/master/' + \
       'csse_covid_19_data/csse_covid_19_time_series/'+\
       'time_series_covid19_'
pag1 = ['confirmed', 'deaths', 'recovered']
pags = [pag0+x+'_global.csv' for x in pag1]
CDR  = [pd.read_csv(x, index_col=1) for x in pags]

def seleccionarPais(pais='Colombia',fecha='3/6/20'):
    d = [x.loc[pais,fecha:].astype(int) for x in CDR]
    d  = pd.DataFrame({'C':d[0], 'M':d[1], 'R':d[2]})
    d.index=pd.date_range(fecha, periods=d.shape[0], freq='D')
    return d

def SIR(inic, t, lamb, gamma):
    S, I, R = inic
    return [-lamb*S*I, lamb*S*I-gamma*I, gamma*I]

inic = [40000,54,0]
t = np.linspace(1,71,71)
SIR_t = odeint(SIR, inic, t, args=(0.001,0.001))


def SIR0(lb, Obs):
    l, b = lb
    SIR_t0 = [40000, 102, 0]
    t0 = Obs.shape[0]
    t = np.linspace(1,t0,t0)
    SIR_t = odeint(SIR, SIR_t0, t, args=(l,b))
    ErrorC = np.sqrt(np.mean((SIR_t[:,1] - Obs['C'])**2))
    ErrorR = np.sqrt(np.mean((SIR_t[:,2] - Obs['R'])**2))
    return 0.05*ErrorC + 0.95*ErrorR

from scipy.optimize import minimize
Col = seleccionarPais()
lg_est = minimize(SIR0, [0.0001, 0.01],
                   args=(Col), method='L-BFGS-B',
                   bounds=[(0.0000000001, 0.2),
                           (0.0000000001, 0.2)])

fecha = '3/6/20'
Modelo = odeint(SIR, [40000,102,0], np.linspace(1,200,200),\
                args=(2.35146309e-06, 1.32411426e-02))
Modelo = pd.DataFrame(Modelo,columns=['S','I','R'],\
                      index = pd.date_range(fecha,\
                      periods=Modelo.shape[0], freq='D'))

plt.figure(figsize=(10,10))
fig = sns.lineplot(Modelo.index,'I',data=Modelo,label=r'$I(t)$')
fig = sns.lineplot(Modelo.index,'R',data=Modelo,label=r'$R(t)$')
fig = sns.lineplot(Col.index, 'R', data=Col, label='Recuperados')
fig = sns.lineplot(Col.index, 'C', data=Col, label ='Infectados')
fig.set(xlabel='Fecha', ylabel='Número')
plt.xticks(rotation=30, horizontalalignment='left',\
           fontweight='light')
