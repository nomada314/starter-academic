+++
date      = 2021-06-09
lastmod   = 2023-02-03
draft     = false
tags      = ["Teaching", "Probability"]
title     = "Estadística General"
math      = true
+++

### Libro guía:

López, A., Rojas-Peña, M.L., & Rojas, A.L. (2022). [Herramientas para el análisis estadístico de datos biológicos en R](https://alexrojas.netlify.app/publication/hbio/). Editorial UPTC.

### Otras referencias:

+ 
+ 

### Horas de oficina: 

Por cita.

### Horario

Semana | Fecha | Tema |
---| ---| --- |
1  | Feb 08 | Presentación del curso <br> Variables, datos y tipo de estudios [1.1, 1.2] <br> Introducción a `R` [1.3] |
&nbsp; | Feb 10 | Lectura de datos [1.3.1] |
2  |  Feb 13 | Manipulación de datos [1.3.2]  |
&nbsp; | Feb 15 | Manipulación de datos, continuación [1.3.2]  |
&nbsp; | Feb 17 | Cálculo de estadísticas [1.3.3] |
3  |  Feb 20 | Gráficas para una variable [2.1.1] |
&nbsp; | Feb 22 | Gráficas para variables variable [2.1.2] |
&nbsp; | Feb 24 | Transformaciones [2.2] |
4  |  Feb 27 | Transformaciones, continuación [2.2] |
&nbsp; | Mar 01 | Sesión de preguntas |
&nbsp; | Mar 03 | Examen I |


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

### Contenidos mínimos

+ **Unidad 1. Espacios muestrales y probabilidad.** Axiomas de probabilidad. Probabilidad condicional, teorema de la probabilidad total. Independencia. Conteo.
+ **Unidad 2. Variables aleatorias discretas.** Funciones de masa de probabilidad.  Valor esperado. 
+ **Unidad 3. Variables aleatorias continuas.** Funciones de densidad. Funciones de variables aleatorias. Funciones conjuntas. Sumas de variables aleatorias.
+ **Unidad 4. Convergencia**
+ **Unidad 5. Análisis Exploratorio de Datos**

### Evaluación

Para el primer 50 se hará un examen con un peso del 50% y dos talleres con un peso del 40%. Para el segundo 50 se harán dos exámenes con un peso del 90%. El examen con mejor nota valdrá 50% y el otro 40%.

El 10% restante corresponde a participación. Esta participación será evaluada de dos formas. La primera correponde a la participación haciendo preguntas y contestando preguntas durante la clase. La segunda corresponde a un trabajo que hará cada estudiante individualmente el lunes anterior a cada examen. Este trabajo consiste en crear una pregunta de selección múltiple del material a evaluar en el examen. Toda las entregas deben hacerse a tiempo, ya que no se aceptará material después de la hora de entrega establecida. Además, se debe entregar un archivo en formato markdown. **NO** se aceptan archivos en ningún otro formato.

### Enlace encuentros sincrónicos

meet.google.com/int-sgza-foi


### Horas de oficina: 

Por cita.
-->
