+++
date      = 2021-06-09
lastmod   = 2022-08-26
draft     = false
tags      = ["Teaching", "Probability"]
title     = "Probabilidad y Estadística"
math      = true
+++

### Libro guía:

Kottegoda, N. T. & Rosso, R. (2008). *Applied Statistics for Civil and Environmental Engineers*. Blackwell Publishing


### Otras referencias:

+ Benjamin, J. R. & Cornell, C. A. (2014). *Probability, statistics, and decision for civil engineers.* Courier Corporation.
+ Berthouex, P.M. & Brown, L.C. (2002). *Statistics for Environmental Engineers.* Lewis Publishers.
+ Shaefer, S.J. & Theodore, L. (2007). *Probability and Statitsics Applications for Environmental Science*. CRC Press.

### Horas de oficina: 

Por cita.

### Horario

|Semana |Fecha      |Tema                                                                                                                                                                                                                            |
|:------|:----------|:-------------------------------------------------------------------|
|1      |2022-08-30 | Presentación del curso <br>  Eventos aleatorios [KR 2.1] |
|&nbsp; |2022-09-01 | Medidas de probabilidad [KR 2.2] |
|2      |2022-09-06 | Probabilidad condicional  |
|&nbsp; |2022-09-08 | Ejercicios |
|3      |2022-09-13 | Variables aleatorias |
|&nbsp; |2022-09-15 | Función de masa de probabilidad <br> Función de densidad de probabilidad <br> Valor esperado |
|4      |2022-09-20 | **Sesión de preguntas** |
|&nbsp; |2022-09-22 | **Examen I** |
|5      |2022-09-27 | Algunas distribuciones discretas  |
|&nbsp; |2022-09-29 | Algunas distribuciones discretas |
|6      |2022-10-04 | Algunas distribuciones continuas  |
|&nbsp; |2022-10-06 | Algunas distribuciones continuas |
|7      |2022-10-11 | &nbsp; |
|&nbsp; |2022-10-13 | &nbsp; |
|8      |2022-10-18 | &nbsp; |
|&nbsp; |2022-10-20 | &nbsp; |
|9      |2022-10-25 | &nbsp; |
|&nbsp; |2022-10-27 | &nbsp; |
|10     |2022-11-01 |  |
|&nbsp; |2022-11-03 |  |
|11     |2022-11-08 |  |
|&nbsp; |2022-11-10 |   |
|12     |2022-11-15 |  |
|&nbsp; |2022-11-17 |  |
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


