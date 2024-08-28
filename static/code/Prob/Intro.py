# %% [markdown]
# ### Asignación de variables

# %%
import math
import numpy as np
import random as rnd

# %%
entero = 3
puntoFlotante = 2.3
complejo = 1 + 4j
numerosAleatorio = rnd.randint(0,10)
complejo2 = numerosAleatorio + 1j

# %% [markdown]
# Listas

# %%
notas = [3, 3.5, 5, 4.3]

# %%
notas

# %% [markdown]
# Arreglos `Numpy`

# %%
notasNumpy = np.array(notas)

# %%
notasNumpy

# %% [markdown]
# Secuencias de caracteres

# %%
direccionPagina = 'https://alexrojas.netlify.app/Data/Bio/'

# %% [markdown]
# ### Cálculos básicos

# %%

tasa = 0.05
print(1+tasa)
tasa = 0.02
print(1+tasa)

# %%
tasa = 0.01
tasa = tasa + 0.005
tasa = tasa + 0.003
print(tasa)

# %%
f"Tres elevado a la 2 es {3**2}"
f"La tasa de interés es {tasa}, pero esta aumentará 10 %, es decir, la nueva tasa es {tasa*1.1}"

# %% [markdown]
# $850500\cdot (1+ 0.02)^2\cdot 0.45$

# %%
850500*((1 + 0.02)**2)*45/100

# %%
850500*((1 + 0.02)**2)*0.45

# %%
np.sin(math.pi/4)

# %% [markdown]
# ### Lectura de datos

# %%
#import polars as pl
import pandas as pd

# %%
Depredador_Grad = pl.read_csv(direccionPagina+'Camacho_ELEV.csv')

# %%
Depredador_Grad = pd.read_csv(direccionPagina+'Camacho_ELEV.csv')

# %%
Depredador_Grad = pd.read_csv(direccionPagina+'Camacho_ELEV.csv',  dtype={'SLOPE' : 'category'} )

# %%
Depredador_Grad.dtypes 

# %%
codigo, valores = pd.factorize(Depredador_Grad.SLOPE)

# %%
base = 'https://www.strongmotioncenter.org/wserv/events/query?minmag='
min = 4
max = 8
ordenar = 'time'
pagina = base + str(4)  + '&maxmag=' + str(max) + '&orderby=' + ordenar + '&format=csvfile&nodata=404'

# %%
pagina

# %%
mag4a8 = pd.read_csv(pagina, skiprows=1)

# %%
import geopandas as gpd

# %%
mag4a8g = gpd.GeoDataFrame(mag4a8, geometry=gpd.points_from_xy(mag4a8.Longitude, mag4a8.Latitude), crs="EPSG:4326")

# %%
mag4a8g

# %%
import matplotlib.pyplot as plt

# %%
mag4a8g.plot()

# %%
mag4a8g.plot(column = 'Magnitude', cmap = 'OrRd', legend = 'True')

# %%
mag4a8g.plot(column = 'Depth', cmap = 'hot', legend = 'True')

# %%
import os

# %%
os.getcwd()

# %%
#os.chdir('../../Courses/CivProbEst/Code')

# %%
peatones = pd.read_csv('Data/FARS2022NationalCSV/nmcrash.csv')

# %%
peatones
