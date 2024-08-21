+++
date      = 2021-06-09
lastmod   = 2024-08-06
draft     = false
tags      = ["Teaching", "Probability"]
title     = "Probabilidad y Estadística"
math      = true
+++

### Horario
Martes 4:00 - 6:00 PM, A201 <br>
Jueves 4:00 - 6:00 PM, TBA 


### Libros guía:

+ López, A., Rojas-Peña, M. L. & Rojas, A. L. (2022) [Herramientas para el Análisis Estadístico de Datos en R](https://alexrojas.netlify.app/publication/hbio/). Editorial UPTC.
+ Kottegoda, N. T. & Rosso, R. (2008). *Applied Statistics for Civil and Environmental Engineers*. Blackwell Publishing

### Otras referencias:

+ Benjamin, J. R. & Cornell, C. A. (2014). *Probability, statistics, and decision for civil engineers.* Courier Corporation.
+ Berthouex, P.M. & Brown, L.C. (2002). *Statistics for Environmental Engineers.* Lewis Publishers.
+ López, A. & Rojas, A. L. (2021) [Una Introducción a Python para Estudiantes de Ciencias](https://alexrojas.netlify.app/publication/prog/). Editorial UPTC.
+ Shaefer, S.J. & Theodore, L. (2007). *Probability and Statitsics Applications for Environmental Science*. CRC Press.

### Horas de oficina: 

Lunes 2:00 - 4:00 PM o por cita. <br>
**Lugar**: La Colina Casa 2. 

### Contenidos temáticos mínimos

* **Unidad 1. Manipulación de bases datos:** lectura, filtración de individuos y selección de variables.

* **Unidad 2. Análisis exploratorio de datos:** estadísticas descriptivas, gráficos estadísticos.

* **Unidad 3. Probabilidad:** Axiomas de probabilidad, reglas de probabilidad, probabilidad condicional.

* **Unidad 4. Variables aleatorias:** Definición de variables aleatorias, valores esperados, distribuciones.

* **Unidad 5. Estimación:** puntual e intervalo.


### Agenda

Semana | Fecha | Tema |
---| ---| ---- |
1      | 08-20 | Presentación del curso |
&nbsp; | 08 - 22 | Variables, datos y tipo de estudios [1.1, 1.2] <br> Introducción a `Python`. <br> Lectura de datos [1.3.1] |
2  |  08 - 27 | Manipulación de datos [1.3.2]  |
&nbsp; | 08 - 29 | Cálculo de estadísticas [1.3.3] |
3  |  09 - 03 | Gráficas para una variable [2.1.1] |
&nbsp; | 09 - 05 | Gráficas para variables variable [2.1.2] |
4  | 09 - 10 | Sesión de preguntas |
&nbsp; | 09 - 12  | **Primer Examen** |


<!--
&nbsp; | 08-22 | Espacio muestral y eventos |
2      | 08-27 | Probabilidad |
&nbsp; | 08-29  | Probabilidad, cont. |
3      | 09-03 | Probabilidad Condicional |
&nbsp; | 09-05  | Independencia y regla de Bayes |
4      | 09-10 | Sesión de preguntas |
&nbsp; | 09-12  | **Primer Examen** |
5      | 09-17 | Variables aleatorias |
&nbsp; | 09-19 | Función de masa de probabilidad <br> Función de densidad de probabilidad |
6      | 09-24 | Función de distribución y de fiabilidad |
&nbsp; | 09-26 | Función cuantil |
7      | 10-01 | Funciones de variables aleatorias |
&nbsp; | 10-03 | Estadísticas de orden |
8      | 10-08 | Sesión de preguntas |
&nbsp; | 10-10  | **Segundo Examen** |
-->

### Evaluación

La nota final será obtenida así: 

* Primer 50: un examen (30%), dos talleres (30%), presentación (30%) y participación (10%). 
* Segundo 50: dos exámenes con un peso del 50%, un taller (30%). El examen con mejor nota valdrá 35% y el otro 15%. Participación (20%).

### Data sets

#### [Earthquakes with Strong-Motion Data in CESMD](https://www.strongmotioncenter.org/wserv/events/builder/)


Por ejemplo:

* [https://www.strongmotioncenter.org/wserv/events/query?minmag=4&maxmag=10&orderby=time&format=csvfile&nodata=404](https://www.strongmotioncenter.org/wserv/events/query?minmag=4&maxmag=10&orderby=time&format=csvfile&nodata=404)
* [https://www.strongmotioncenter.org/wserv/events/query?minmag=4&maxmag=10&orderby=magnitude-asc&format=csvfile&nodata=404](https://www.strongmotioncenter.org/wserv/events/query?minmag=4&maxmag=10&orderby=magnitude-asc&format=csvfile&nodata=404)

```{python}
import pandas as pd

base = 'https://www.strongmotioncenter.org/wserv/events/query?minmag='
min = 4
max = 8
ordenar = 'time'
pagina = base + min  + '&maxmag=' + max + '&orderby=' + ordenar + '&format=csvfile&nodata=404'
mag4a8 = pd.read_csv(pagina, skiprows=1)
```

#### National Highway Traffic Safety Administration

https://www.nhtsa.gov/file-downloads?p=nhtsa/downloads/FARS/2022/National/

<!--
### 

### 

Considere el archivo localizado en la siguiente dirección https://alexrojas.netlify.com/Data/Prog/gene_table.txt.  Este archivo contiene la siguiente información de genes en el genoma humano: símbolo, biotipo, cromosoma, hebra y número de transcripciones. Por ejemplo, el primer gen en el archivo tiene el símbolo `TSPAN6`, está localizado en la hebra `-` del cromosoma `X` y tiene 5 transcripciones. Además es un gen que codifica para proteína. El símbolo de cada gen sigue los estándares dados por el Comité para la Nomenclatura de Genes del Genoma Humano (HUGO Gene Nomenclature Committee, [HGNC](https://www.genenames.org/)).  Al digitar `TSPAN6` en el campo de búsqueda en la página en internet de este Comité, encontramos que el nombre es `tetraspanin 6` y su localización citogenética es `Xq22.1`, es decir, la posición `22.1` del brazo largo del cromosoma `X`. Al buscar este gen en la página: [https://www.ensembl.org/](https://www.ensembl.org/) y desplegar la tabla de transcripción podemos observar la lista de las 5 transcripciones.

Realice la siguiente manipulación:

* Importe el archivo `gene_table.txt`. Aunque este archivo tiene extensión `txt`, los valores son separados por comas. Además, note que el número de transcripciones es un número entero
* Renombre las variables con nombres en castellano
* Filtre únicamente los genes localizados en los cromosomas 2, 6 y X
* Utilizando la función `tolower()`, pase el nombre de los genes de mayúsculas a minúsculas
* Filtre los genes con biotipo igual a `lincRNA`





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

