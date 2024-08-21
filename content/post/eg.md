+++
date      = 2021-06-09
lastmod   = 2024-08-06
draft     = false
tags      = ["Teaching", "Probability"]
title     = "Estadística General"
math      = true
+++

### Horario

Lunes 8:00 - 10:00 AM. R315 <br>
Martes 10:00 - 12:00 M. A204 <br>

### Libro guía:

López, A., Rojas-Peña, M.L., & Rojas, A.L. (2022). [Herramientas para el análisis estadístico de datos biológicos en R](https://alexrojas.netlify.app/publication/hbio/). Editorial UPTC.

### Otras referencias:

* Devore, J (2005). Probabilidad y Estadística para Ingeniería y Ciencias. Sexta Edición. Editorial
Thomson.
* Ismay, C. & Kim A. Y. (2019) Statistical Inference via Data Science: A ModernDive into R and the Tidyverse.  Chapman and Hall [Página del libro](https://moderndive.com)
* Whitlock, M. C. & Schluter, D (2015). The Analysis of Biological Data. W. H. Freeman.

### Horas de oficina: 

Lunes 2:00 - 4:00 PM o por cita. <br>
**Lugar**: La Colina Casa 2. 

### Software

Utilizaremos el lenguaje `R` y la interface `RStudio`. Estos *softwares* son de libre acceso y pueden descargarse de las páginas: 

* [https://www.icesi.edu.co/CRAN/](https://www.icesi.edu.co/CRAN/)
* [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)


### Agenda

Semana | Fecha | Tema |
---| ---| --- |
1  | 08 - 19 | Festivo |
&nbsp; | 08 - 20 | Presentación del curso  |
2  |  08 - 26 | Variables, datos y tipo de estudios [1.1, 1.2] <br> Introducción a `R` [1.3] Lectura de datos [1.3.1]  |
&nbsp; | 08 - 27 | Manipulación de datos [1.3.2] <br> Cálculo de estadísticas [1.3.3] |
3  |  09 - 02 | Gráficas para una variable [2.1.1] |
&nbsp; | 09 - 03 | Gráficas para variables variable [2.1.2] |
4  | 09 - 09 | Sesión de preguntas |
&nbsp; | 09 - 10  | **Primer Examen** |


<!--
### Contenidos mínimos

+ **Unidad 1. Espacios muestrales y probabilidad.** Axiomas de probabilidad. Probabilidad condicional, teorema de la probabilidad total. Independencia. Conteo.
+ **Unidad 2. Variables aleatorias discretas.** Funciones de masa de probabilidad.  Valor esperado. 
+ **Unidad 3. Variables aleatorias continuas.** Funciones de densidad. Funciones de variables aleatorias. Funciones conjuntas. Sumas de variables aleatorias.
+ **Unidad 4. Convergencia**
+ **Unidad 5. Análisis Exploratorio de Datos**
-->

### Evaluación

* Primer 50: un examen (30%), dos talleres (30%), presentación (30%) y participación (10%). 
* Segundo 50: dos exámenes con un peso del 80%. El examen con mejor nota valdrá 50% y el otro 30%. Participación (20%).

La participación será evaluada a través de la lectura previa del material, preguntas durante la clase  y contestando preguntas. <br>
Para la presentación, cada estudiante buscará una artículo científico, en cualquier área de Química, en el cual los datos estén disponibles en internet o en el mismo artículo y replicará las gráficas y análisis básicos hechos en este. Se debe entregar el código en `R` utilizado.


### Data sets


#### Earthquakes with Strong-Motion Data in CESMD

``Use the form below to build a URL to the CESMD Earthquake Strong-Motion-Data web service. Click the generated URL at the bottom of this page to retrieve earthquake parameters.``

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


<!--
La segunda corresponde a un trabajo que hará cada estudiante individualmente el lunes anterior a cada examen. Este trabajo consiste en crear una pregunta de selección múltiple del material a evaluar en el examen. Toda las entregas deben hacerse a tiempo, ya que no se aceptará material después de la hora de entrega establecida. Además, se debe entregar un archivo en formato markdown. **NO** se aceptan archivos en ningún otro formato.
-->


<!--
8  | Oct 19 |  <font color="green">Sesión de preguntas</font>  |
&nbsp; | Oct 21 | <font color="red">Examen II</font> |
9 | Oct 26 | Solución Examen II |
&nbsp; | Oct 28 | Semana de la investigación |
10 | Nov 02 | Análisis exploratorio de datos |
&nbsp; | Nov 04 | Capacitación jurado de votación |
11 | Nov 09 | Análisis exploratorio de datos, continuación |
&nbsp; | Nov 11 | Análisis exploratorio de datos, continuación |
12 | Nov 16 | <font color="green">Sesión de preguntas</font> |
&nbsp; | Nov 18 | <font color="red">Examen III</font> |
13 | Nov 23 | |
&nbsp; | Nov 25 |  |



### Código Noviembre 2

```{r}
library(tidyverse)
library(knitr)
library(wooldridge)
library(kableExtra)

data('ceosal1')

```

### Código Septiembre 9

```{r}

## Si ya está instalada  la librería tidyverse:
# install.packages(c("wooldridge","knitr","kableExtra"))

## De otro modo:
# install.packages(c("wooldridge","knitr","kableExtra","tidyverse"))


library(tidyverse)
library(knitr)
library(wooldridge)
library(kableExtra)

data(alcohol)

alcohol$abuse = factor(alcohol$abuse, labels = c("No alcohólico","Alcohólico"))


#  Tabla de frecuencias abuso de alcohol
table(alcohol$abuse)


# Diagrama de barras

ggplot(alcohol, aes(x= abuse)) +
  geom_bar() +
  labs(x="Abuso de alcohol", y="Frecuencia")


#  Tabla de frecuencias relativas abuso de alcohol
prop.table(table(alcohol$abuse))

tAlcohol = round(prop.table(table(alcohol$abuse)),3)


## Tabla de contingencia abuso de alcohol vs padre alcohólico

AlcPadre = table(alcohol$fathalc, alcohol$abuse)

# Impresión en pantalla con diferentes formatos

kable(AlcPadre, "pipe")

prop.table(AlcPadre) %>%
  kable("html", col.names = c("No", "Sí"), digits = 2) %>%
  kable_styling("striped", full_width = F) %>%
  add_header_above(c("","Abusa del alcohol"=2))


## Diagrama de barras agrupadas


AlcPadre = alcohol %>%
  group_by(fathalc,abuse) %>%
  summarize(f = n()/9822)


AlcPadre = alcohol %>%
  group_by(fathalc,abuse) %>%
  summarize(f = n()) %>%
  group_by(fathalc) %>%
  summarize(abuse, p = f/sum(f))



ggplot(AlcPadre, aes(x = factor(fathalc, labels = c("No","Sí")), y = p, fill= abuse)) +
  geom_bar(stat = "identity", position = "dodge2") +
  labs(x="Padre alcohólico", y="Frecuencia", fill = "Abuso de alcohol")


ggplot(AlcPadre, aes(x = factor(fathalc, labels = c("No","Sí")), y = p, fill= abuse)) +
  geom_bar(stat = "identity", position = "dodge2") +
  labs(x="Padre alcohólico", y="Frecuencia", fill = "Abuso de alcohol") +
  theme(legend.position = "bottom")
  
ggplot(AlcPadre, aes(x = factor(fathalc, labels = c("No","Sí")), y = p, fill= abuse)) +
  geom_bar(stat = "identity", position = "dodge2") + 
  scale_fill_manual(values=c("#003399", "#336600")) +
  labs(x="Padre alcohólico", y="Frecuencia", fill = "Abuso de alcohol") +
  theme(legend.position = "bottom")
  
```

### Código Septiembre 2

```{r}
# install.packages("readxl")
# install.packages("tidyverse")

library(readxl)
library(tidyverse)

# Lectura de la base de datos
Can  = read_excel('CanEmpNov20.xlsx',1)

# Cálculo de la proporción de desempleados por provincia
Can = Can %>% mutate(PorcDesempleado = Unemployed/Population)

# Cálculo de la población total y total de desempleados
Can %>% summarise(Pob = sum(Population), Desempleo = sum(Unemployed))

# Proporción de desempleados
1735100/31275600
```

<font color="red">Sesión de preguntas</font> 




### Libro guía:

Pishro-Nik, H. (2014) *Introduction to Probability, Statistics, and Random Processes*. Kappa Research, LLC. <br>
Disponible *online* en la dirección: https://www.probabilitycourse.com

### Otras referencias:

+ Bertsekas, D. P. y Tsitsklis, J. N. (2002). *Introduction to Probability*. Athena Scientific.
+ Blanco, L. (2008). *Probabilidad*. Editorial UNAL.
+ Ross, S. M. (2014). *Introduction to Probability Models*. Academic press.

-->
