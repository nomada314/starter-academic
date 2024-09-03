# %% [markdown]
# ### Cálculo de Estadísticas Descriptivas Variables Cuantitativas:
# 
# * Medidas de orden o posición:
#     - Resumen de los cinco números: Mínimo, Primer cuartil, Segundo cuartil o mediana, Tercer cuartil, Máximo (Mín, Q1, Q2, Q3, Máx)
#     - Deciles
#     - Percentiles

# %%
import pandas as pd
direccionPagina = 'https://alexrojas.netlify.app/Data/Bio/'

# Lectura de la base de datos
Herradura = pd.read_fwf(direccionPagina+'Cangrejos.dat')

# Resumen de los cinco números
# Para la variable peso
Herradura['weight'].quantile((0,0.25,0.5,0.75,1))

# %%
# Otra forma de especificar la secuencia de cuartiles: (0,0.25,0.5,0.75,1)
import numpy as np
np.arange(0, 1.01, 0.25)

# %%
# Resumen de los cinco números
# Para todas las variables en Herradura
Herradura.quantile(np.arange(0, 1.01, 0.25))

# %%
# Deciles
# Secuencia para los deciles
np.arange(0, 1.01, 0.1)

# %%
# Deciles
# Para la variable peso
Herradura['weight'].quantile(np.arange(0, 1.01, 0.1))

# %%
# Percentiles
# Secuencia para los percentiles
np.arange(0, 1.01, 0.01)

# %%
# Percentiles
# Para la variable peso
Herradura['weight'].quantile(np.arange(0, 1.01, 0.01))

# %%
# Taller
# Obtenga e interprete el resumen de los cinco números para la variable width
# Obtenga los deciles para la variable width, interprete el cuarto decil
# Obtenga los percentiles para la variable width, interprete el percentil 65

# %% [markdown]
# ### Cálculo de Estadísticas Descriptivas Variables Cuantitativas:
# 
# * Medidas de centro o localización:
#     - Media aritmética: promedio de las observaciones de una variable cuantitativa 
#     - Mediana: valor en el centro de las observaciones ordenadas del mínimo al máximo

# %%
# Media
# Para la variable peso
Herradura['weight'].mean()

# %%
# Mediana o segundo cuartil (Q2)
# Para la variable peso
Herradura['weight'].median()

# %%
# Taller
# Obtenga e interprete la media de la variable width

# %% [markdown]
# ### Cálculo de Estadísticas Descriptivas Variables Cuantitativas:
# 
# * Medidas de variabilidad o dispersión:
#     - Varianza
#     - Desviación estándar
#     - Rango intercuartílico (Q3 - Q1)
#     - Rango (Máx -  Mín)         

# %%
# Varianza (en unidades cuadradas)
# Para la variable peso
Herradura['weight'].var()

# %%
# Desviación estándar (en las mismas unidades en las que se mide la variable a la cual se le está calculando la desviación estándar)
# Para la variable peso
Herradura['weight'].std()

# %%
# La desviación estándar es la raíz cuadrada de la varianza
np.sqrt(0.33295809712326924)

# %%
# Rango intercuartílico
Herradura['weight'].quantile(.75)-Herradura['weight'].quantile(.25)

# %%
# Rango
Herradura['weight'].max()-Herradura['weight'].min()

# %%
# Taller
# Obtenga la desviación estándar, el rango intercuartílico y el rango de la variable width


