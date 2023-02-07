+++
date      = 2021-06-09
lastmod   = 2023-02-03
draft     = false
tags      = ["Teaching", "Probability"]
title     = "Probabilidad y Estadística"
math      = true
+++

### Libros guía:

+ López, A., Rojas-Peña, M. L. & Rojas, A. L. *Herramientas para el análisis estadístico de datos en R* Editorial UPTC.
+ Kottegoda, N. T. & Rosso, R. (2008). *Applied Statistics for Civil and Environmental Engineers*. Blackwell Publishing


### Otras referencias:

+ Benjamin, J. R. & Cornell, C. A. (2014). *Probability, statistics, and decision for civil engineers.* Courier Corporation.
+ Berthouex, P.M. & Brown, L.C. (2002). *Statistics for Environmental Engineers.* Lewis Publishers.
+ Shaefer, S.J. & Theodore, L. (2007). *Probability and Statitsics Applications for Environmental Science*. CRC Press.

### Horas de oficina: 

Por cita.

### Horario

|Semana |Fecha      |Tema |                                                                        
|:------|:----------|:-------------------------------------------------------------------|
|1      |2023-02-07 | Presentación del curso <br>  Eventos aleatorios [KR 2.1] |
|&nbsp; |2023-02-09 | Variables y datos.`R` y `R Studio` |
|2      |2023-02-14 | &nbsp;  |
|&nbsp; |2023-02-16 | &nbsp; |


<!--
|3      |2022-09-13 | Variables aleatorias |
|&nbsp; |2022-09-15 | Función de masa de probabilidad <br> Función de densidad de probabilidad <br> Valor esperado |
|4      |2022-09-20 | **Sesión de preguntas** |
|&nbsp; |2022-09-22 | **Examen I** |
|5      |2022-09-27 | Solución Examen I  |
|&nbsp; |2022-09-29 | Bernoulli |
|6      |2022-10-04 | Binomial, Poisson  |
|&nbsp; |2022-10-06 | Ejercicios Binomial y Poisson |
|7      |2022-10-11 | Uniforme, Exponencial |
|&nbsp; |2022-10-13 | Normal |
|8      |2022-10-18 | **Sesión de preguntas** |
|&nbsp; |2022-10-20 | **Examen II** |
|9      |2022-10-25 | Solución Examen II |
|&nbsp; |2022-10-27 | Semana de la Investigación |
|10     |2022-11-01 | Diálogo Regional Vinculante |
|&nbsp; |2022-11-03 | Análisis de datos exploratorio |
|11     |2022-11-08 | Análisis de datos exploratorio, continuación |
|&nbsp; |2022-11-10 | Análisis de datos exploratorio, continuación  |
|12     |2022-11-15 | **Sesión de preguntas** |
|&nbsp; |2022-11-17 | **Examen III** |
|13     |2022-11-22 |  |
|&nbsp; |2022-11-24 |  |
|14     |2022-11-29 |  |
|&nbsp; |2022-12-01 |   |
|15     |2022-12-06 |  |
|&nbsp; |2022-12-08 |&nbsp;    |
|16     |2022-12-13 |   |
|&nbsp; |2022-12-15 |    |


## Código

```{python}
## Código Sep 1, 2022
import numpy as np
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt

# Lectura de los datos
rupture = pd.read_csv("https://alexrojas.netlify.com/Data/Prob/rupture.csv")

# Histograma
sns.histplot(data=rupture, x="mr")

# Frecuencias en A y B

A = rupture[(rupture.mr < 50)*(rupture.mr > 25)]
B = rupture[(rupture.mr < 60)*(rupture.mr > 35)]
A.shape
B.shape

# Histograma otra partición
sns.histplot(data=rupture, x="mr", bins = range(5,75,5))

# Obtener frecuencias utilizando histogram
conteos, particion  = np.histogram(rupture.mr, bins = np.arange(5,75,5))
pd.DataFrame({'intervalo': [str(i)+'-'+str(i+5) for i in particion[:-1]], 'Frec':conteos}).set_index('intervalo')

# Frecuencias en A y B
ruptureFrec['25-30':'45-50'].sum(axis=0)
ruptureFrec['35-40':'55-60'].sum(axis=0)

# AB
ruptureFrec['35-40':'45-50'].sum(axis=0)/165
# A+B
ruptureFrec['25-30':'55-60'].sum(axis=0)/165
```
-->

