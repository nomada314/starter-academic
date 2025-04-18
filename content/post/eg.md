+++
date      = 2021-06-09
lastmod   = 2024-08-06
draft     = true
tags      = ["Teaching", "Probability"]
title     = "Estadística General"
math      = true
+++


## Contenidos temáticos mínimos

* **Unidad 1. Manipulación de bases datos:** lectura, filtración de individuos y selección de variables.

* **Unidad 2. Análisis exploratorio de datos:** estadísticas descriptivas, gráficos estadísticos.

* **Unidad 3. Probabilidad:** Axiomas de probabilidad, reglas de probabilidad, probabilidad condicional.

* **Unidad 4. Variables aleatorias:** Definición de variables aleatorias, valores esperados, distribuciones.



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

Utilizaremos el lenguaje `R` y la interface `RStudio`, estos son de libre acceso y pueden descargarse de las páginas: 

* [https://www.icesi.edu.co/CRAN/](https://www.icesi.edu.co/CRAN/)
* [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)


### Agenda

Semana | Fecha | Tema |
---| ---| --- |
1  | 08 - 19 | Festivo |
&nbsp; | 08 - 20 | Presentación del curso  |
2  |  08 - 26 | Variables, datos y tipo de estudios [1.1, 1.2] <br> Introducción a `R` [1.3] <br> Lectura de datos [1.3.1]  |
&nbsp; | 08 - 27 | Lectura de datos, continuación <br>Manipulación de datos [1.3.2]  |
3  |  09 - 02 | Cálculo de estadísticas [1.3.3]  |
&nbsp; | 09 - 03 | Cálculo de estadísticas, continuación |
4  | 09 - 09 | Gráficas para una variable [2.1.1] |
&nbsp; | 09 - 10  | Gráficas para varias variables [2.1.2] <br> Transformaciones [2.2] |
5  | 09 - 16 | Eventos y probabilidad [3.1] |
&nbsp; | 09 - 17  |  Probabilidad condicional [3.2] <br> Entrega Taller 1 |
6  | 09 - 23 | Sesión de preguntas |
&nbsp; | 09 - 24  | **Primer Examen** |
7  | 09 - 30 | Presentaciones |
&nbsp; | 10 - 01  | Presentaciones|
8  | 10 - 07 | Presentaciones |
&nbsp; | 10 - 08  | Presentaciones <br> Modelos de probabilidad [3.3] <br> Entrega Taller 2 |
9  | 10 - 14 | Festivo |
&nbsp; | 10 - 15  | Modelos de probabilidad, continuación|
10  | 10 - 21 | Modelos de probabilidad, continuación |
&nbsp; | 10 - 22  | Modelos de probabilidad, continuación |
11  | 10 - 28 | Introducción Inferencia [4] <br> Entrega Taller 3|
&nbsp; | 10 - 29  | Máxima Verosimilitud [4.1] <br> Intervalos de confianza [4.2] |
12  | 11 - 04 | Festivo |
&nbsp; | 11 - 05  |  Intervalos de confianza [4.2] |
&nbsp; | 11 - 08  |  Entrega Taller 4 |
13  | 11 - 11 | Festivo |
&nbsp; | 11 - 12  | **Segundo Examen** <br> [PONDICE.XLS](https://alexrojas.netlify.app/Data/EG/PONDICE.XLS)<br> [TILLRATIO.XLS](https://alexrojas.netlify.app/Data/EG/TILLRATIO.XLS)<br> [WINE40.XLS](https://alexrojas.netlify.app/Data/EG/WINE40.XLS)|
14  | 11 - 18 | Intervalos de confianza, continuación |
&nbsp; | 11 - 19  | Pruebas de hipótesis [4.3] <br> Entrega Taller 5|
15  | 11 - 25 | Regresión lineal |
&nbsp; | 11 - 26  | Regresión lineal, continuación <br>[ORGCHEM.XLS](https://alexrojas.netlify.app/Data/EG/SATMOON.XLS)<br>[SATMOON.XLS](https://alexrojas.netlify.app/Data/EG/ORGCHEM.XLS)|
16  | 12 - 02 | Sesión de preguntas<br> Entrega Taller 6 |
&nbsp; | 12 - 03  | **Tercer Examen** <br>[radio.csv](https://alexrojas.netlify.app/Data/EG/radio.csv)<br>[cohete.csv](https://alexrojas.netlify.app/Data/EG/cohete.csv)|


### Evaluación

* Primer 50: un examen (30%), dos talleres (30%), presentación (30%) y participación (10%). 
* Segundo 50: dos exámenes con un peso del 80%. El examen con mejor nota valdrá 50% y el otro 30%. Participación (20%).

La participación será evaluada a través de la lectura previa del material, preguntas durante la clase  y contestando preguntas. <br>
Para la presentación, cada estudiante buscará una artículo científico, en cualquier área de Química, en el cual los datos estén disponibles en internet o en el mismo artículo y replicará las gráficas y análisis básicos hechos en este. Se debe entregar el código en `R` utilizado.


<!--
### Ejercicios

Chemists at Kyushu University examined the linear relationship between maximum absorption rate $Y$ (in nanomoles) and the Hammett substituent constant $x$ for metacyclophane compounds. The data for variants of two compounds are given in the `ORGCHEM.XLS` file. The variants of compound 1 are labeled 1a, 1b, 1d, 1e,1f, 1g, and 1h; the variants of compound 2 are 2a, 2b, 2c, and 2d.

1. Plot the data. Use two different plotting symbols for the two compunds. What do you observe?
2. Using only the data for compound 1, fit the model $E(Y) = \beta_0 +\beta_1 x$.
3. Assess the adequacy of the model. Use $\alpha = 0.01$.
4. Repeat 2 and 3 using only the data for compound 2.


High-resolution images of lapetus, one of Saturn's largest moons, were obtained by the Cassini spacecraft and analyzed by NASA. Using widebands filters, the rations of ultraviolet to green and infrared to green wavelengths were measured at 24 moon locations. Acoording to the researchers, "the data's linear trend suggests mixing of two end members: Cassini Regio with a red spectrum and the south polar region with a flat spectrum"

1. Plot the data. Use different plotting symbols for the regions. What do you observe?
2. Conduct a simple linear regression analysis of the data. Do the results support the researchers' statement?
-->

<!--
### Taller

**Fecha de entrega:** Septiembre 17 de 2024, antes de las 2:00pm <br>
**Formato de entrega:** Documento en formato `pdf` de máximo 6 páginas. Debe envíarse por moodle y no debe incluirse código, a menos que sea indicado<br>

Consideramos los datos en el archivo [glass.data](https://alexrojas.netlify.app/Data/EG/glass.data), los cuales corresponden a 214 muestras de vidrio a las culaes se les revisó su índice de refracción  y contenido de 
1. Na: Sodium (unit measurement: weight percent in corresponding oxide)
2. Mg: Magnesium
3. Al: Aluminum
4. Si: Silicon
5. K: Potassium
6. Ca: Calcium
7. Ba: Barium
8. Fe: Iron

La última columna corresponde a la clase de vidrio:

+ 1: building_windows_float_processed
+ 2: building_windows_non_float_processed
+ 3: vehicle_windows_float_processed
+ 5: containers
+ 6: tableware
+ 7: headlamps


Descargue el archivo  e impórtelo. Este archivo tiene un total de 11 columnas y 214 filas. La primera fila es un identificador, la segunda columna corresponde al índice de refracción, las siguientes ocho al contenido de los elementos listados anterioremente y, finalmente, la clase de vidiro.

1. [10] Calcule la media, la mediana, la desviación estándar y el rango intercuartílico para cada una de las variables continuas. Organice la información en una tabla cuyas filas corresponden a las variables. **Incluya el código utilizado**
2. [10] ¿Qué muestra tiene un contenido de Ba mayor a 0.5 y no es un vidrio de faro? **Incluya el código utilizado** 
3. [15] Encuentre las muestras de vidrio tales que `Al <1` y el índice de refracción se encuentra en el intervalo $(1.525, 1530)$. ¿Pertenecen todas al mismo tipo de vidrio? **Incluya el código utilizado**
4. [10] Adicione al conjunto de datos las variables: `C5` y `C7`. Donde la variables `C5` toma el valor  `1` cuando `Ba < 0.3349`, `Al > 1.421`, `Mg > 2.259` y `Na < 13.5` y `0` en otro caso. Por su lado, la variable `C7` toma el valor `1` cuando `Ba > 0.335`. **Incluya el código utilizado** 
5. [20] Cree un diagrama de barras agrupadas mostrando el porcentaje de observaciones que toman el valor `1` y `0` para `C5`, para cada uno de los tipos de vidrios. ¿Qué puede concluir de este gráfico? Repita para `C7`
6. [15] Cree un solo gráfico en el que sea fácilmente identificable el tipo de vidrio con mayor y menor índice de refracción. **Incluya el código utilizado** 
7. [10] Cree un diagrama de dispersión de índice de refracción vs. `Al`. ¿Qué puede concluir con base en este diagrama?
8. [10] ¿Para cuál tipo de vidrio ninguna de las muestras contiene `Fe`? **Incluya el código utilizado** 
-->

   
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
