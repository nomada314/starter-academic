+++
title = "Herramientas para el análisis estadístico de datos biológicos en R"
date = "2022-04-21"
authors = ["López A.", "Rojas-Peña, M. L.", "admin"]
publication_types = ["5"]
publication = "Editorial UPTC"
publication_short = ""
image_preview = ""
doi = "10.19053/9789586606462"
math = true
highlight = true
tags = ["Biology","Inference","EDA","R"]
abstract = "Este libro busca ser una guía práctica que sirva a estudiantes de biología y ciencias naturales para aprender a manejar datos y entender los fundamentos de los modelos estadísticos empleados con frecuencia en su quehacer profesional. La decisión del material contenido en este libro la tomamos respondiendo a la pregunta: ¿qué herramientas y conceptos creemos que necesita saber alguien que estudia biología, para poder realizar su trabajo de grado de forma eficiente? Por lo tanto, hemos minimizado los detalles de tópicos que consideramos no son esenciales para estudiantes de pregrado y hemos omitido completamente cualquier demostración matemática. También hemos incluido simulaciones que ayudan a explicar y visualizar los resultados presentados, además de brindarle al estudiante la oportunidad de mejorar sus habilidades básicas de programación. Hemos incorporado una sección relativamente extensa donde ilustramos cómo crear gráficos en R, que son comúnmente usados en revistas científicas, con la calidad necesaria para reproducirlos en sus propios artículos científicos.  Por otro lado, el enfoque tradicional para aprender a tomar decisiones con base en evidencia estadística, parece un laberinto que el estudiante debe navegar con el fin de seleccionar el intervalo de confianza o la prueba de hipótesis correcta. Una vez encontrada la herramienta adecuada para inferir, el estudiante debe utilizar fórmulas, que aunque sencillas, en ocasiones dejan al estudiante sin entender la idea central de la inferencia estadística. Es por eso, que en este libro nos enfocamos en usar métodos de simulación, que en nuestra opinión permiten entender los conceptos básicos de una forma natural, además de evitar tener que preocuparnos por los requerimientos teóricos del enfoque tradicional."
draft = false
[header]
image = ""
caption = ""
+++

<center><img src="https://simehbucket.s3.amazonaws.com/images/eb99f18bd6fd3173a377c82e120882d6-medium.jpg" width="200">
</center>

[Más información](https://editorial.uptc.edu.co/gpd-herramientas-para-el-analisis-estadistico-de-datos-biologicos-en-r-9789586606462-62f2be2f3ddd8.html)

A continuación se encuentran los conjuntos de datos y el código utilizados en el libro. Además, se encuentran los errrores encontrados a la fecha.

### Datos

Todos los datos se encuentran en el archivo zip: [Datos](https://alexrojas.netlify.app/Data/Bio/Datos.zip). Si solo se desea accesar un archivo en particular, se pueden accesar por su nombre. La dirección para cada uno de los siguientes archivos inicia con `https://alexrojas.netlify.app/Data/Bio/`.


* [BRCA2.fa](https://alexrojas.netlify.app/Data/Bio/BRCA2.fa)
* [Cadaver.txt](https://alexrojas.netlify.app/Data/Bio/Cadaver.txt)
* [Camacho_ELEV.csv](https://alexrojas.netlify.app/Data/Bio/Camacho_ELEV.csv)
* [Camacho_MEC.csv](https://alexrojas.netlify.app/Data/Bio/Camacho_MEC.csv)
* [cangrejos.dat](https://alexrojas.netlify.app/Data/Bio/cangrejos.dat)
* [CgariepinusGrupo.xlsx](https://alexrojas.netlify.app/Data/Bio/CgariepinusGrupo.xlsx)
* [CgariepinusGrupoIndvidual.xlsx](https://alexrojas.netlify.app/Data/Bio/CgariepinusGrupoIndvidual.xlsx)
* [CgariepinusIndividual.xlsx](https://alexrojas.netlify.app/Data/Bio/CgariepinusIndividual.xlsx)
* [CraneoPCA.csv](https://alexrojas.netlify.app/Data/Bio/CraneoPCA.csv)
* [Crecimiento.xlsx](https://alexrojas.netlify.app/Data/Bio/Crecimiento.xlsx)
* [FungalFrequencyArea2.txt](https://alexrojas.netlify.app/Data/Bio/FungalFrequencyArea2.txt)
* [GSE55282.xlsx](https://alexrojas.netlify.app/Data/Bio/GSE55282.xlsx)
* [GSE55282Metadata.csv](https://alexrojas.netlify.app/Data/Bio/GSE55282Metadata.csv)
* [GSE55282Metadata.xlsx](https://alexrojas.netlify.app/Data/Bio/GSE55282Metadata.xlsx)
* [huevos.xlsx](https://alexrojas.netlify.app/Data/Bio/huevos.xlsx)
* [Lobos.txt](https://alexrojas.netlify.app/Data/Bio/Lobos.txt)
* [MoscaTel.csv](https://alexrojas.netlify.app/Data/Bio/MoscaTel.csv)
* [Mutilacion.xlsx](https://alexrojas.netlify.app/Data/Bio/Mutilacion.xlsx)
* [NONCODEv5_yeast.fa](https://alexrojas.netlify.app/Data/Bio/)
* [Parasite.txt](https://alexrojas.netlify.app/Data/Bio/Parasite.txt)
* [Peckoltia2015.xls](https://alexrojas.netlify.app/Data/Bio/Peckoltia2015.xls)
* [Reguladores.csv](https://alexrojas.netlify.app/Data/Bio/Reguladores.csv)
* [ReguladoresConteos.txt](https://alexrojas.netlify.app/Data/Bio/ReguladoresConteos.txt)


## Código

* [Capítulo 1](https://alexrojas.netlify.app/code/Bio/HAEDBCap1.R): Introducción 
* [Capítulo 2](https://alexrojas.netlify.app/code/Bio/HAEDBCap2.R) : Análisis Exploratorioo de Datos
* [Capítulo 3](https://alexrojas.netlify.app/code/Bio/HAEDBCap3.R) : Probabilidad
* [Capítulo 4](https://alexrojas.netlify.app/code/Bio/HAEDBCap4.R) : Inferencia

En lugar de la librería `reshape2`, se recomienda ahora el uso de la librería `tidyr`, como en los siguientes bloques de código:

#### Primer bloque de código p. 31
```{r}
Sat10Largo = Sat10 %>% select(-color,-espina) %>%
  pivot_longer( cols = c("satelites", "y", "peso", "ancho"),
                names_to = "variable", values_to = "value")
```


#### Primer bloque de código p. 34
```{r}
Herradura %>% pivot_longer( cols = c("satelites", "y", "peso", "ancho"),
                   names_to = "VariablesNumericas") %>%
  group_by(VariablesNumericas) %>%
  summarize(Promedio = mean(value), DesvEst = sd(value), Mediana = median(value))
```

#### Segundo bloque de código p. 38
```{r}
gariepinusIG %>%
  drop_na(Cambio) %>%
  group_by(Cambio, socialtrt) %>%
  summarize(frec = n()) %>%
  group_by(socialtrt) %>%
  mutate(prop = frec/sum(frec)) %>%
  select(-frec) %>%
  pivot_wider(names_from = Cambio, values_from = prop)
```

Finalmente, parte de los blques de código también se han escrito en `Python`:

* [Capítulo 1](https://alexrojas.netlify.app/code/Bio/HAEDBCap1.ipynb): Introducción 
* [Capítulo 2](https://alexrojas.netlify.app/code/Bio/HAEDBCap2.ipynb) : Análisis Exploratorioo de Datos

## Errata

Gracias a **Gustavo A. Reyes** por encontrar varios de los errores en los Capítulos I y II descritos a continuación:

### Capítulo I

* p. 10. Segundo párrafo después del código. En lugar de "El cuarto panel, el superior derecho,...", debe ser "El cuarto panel, el superior izquierdo,..."
* p. 25. Cuarta línea del segundo párrafo.  "individuos", no  "individuas"
* p. 36. **Ejemplo 1.16**, última palabra de la tercera línea. En lugar de "contabilizando", debe ser "contabilizado".

### Capítulo II

* p. 56. Sexta línea. Debe ser "aumentamos", en lugar de "disminuimos". Es decir, si se quiere más transparecia, se debe disminuir el valor de `alpha`
* p. 56. **Ejemplo 2.6**. Al definir la variable `Depredacion` del conjunto de datos `Fundulus`, se utilizaron las etiquetas `Si` y `No`. Pero, se debe usar `Sí` y `No` para que la Tabla 2.3 y las figuras 2.10, 2.11 y 2.12 tengan el nombre adecuado en las etiquetas. El siguiente es el código:
```{r}
Fundulus = data.frame(Infeccion = gl(3, 2, labels = etiquetas),
                      Depredacion = gl(2, 1, 6, c('Sí', 'No')),
                      Frec = c(1, 49, 10, 35, 37, 9))
```

### Capítulo III

* p. 118. Después de la **Definición 3.3**, la frase "donde los símbolos + y - representan el resultado" está repetida.
* p. 122. **Ejemplo 3.15** Los cálculos de los valores predictivos positivo y negativo están mal calculados. A continuación se muestra el cálculo correcto.  Para empezar, incluimos la tabla de contingencia para la condición verdadera y los posibles resultados de la prueba, como en la Tabla 3.4 del libro, para los datos de este ejemplo:


|       | **Resultado**  | **prueba rápida**  |     |
|:------|-----------:|---------:|---------:| 
| **VIH**   | Negativo   | Positivo | **Total** |
| No    | 1218       | 129      | 1347  |
| Sí    | 4          | 166      | 170   |
| **Total** | 1222       | 295      | 1517  |

El valor predictivo positivo es entonces

$$\text{PV}+ = \frac{166}{166 + 129} \approx 0.563,$$

luego un individuo que obtenga un resultado positivo tiene una probabilidad del 0.563 de estar infectado por el VIH. Por otro lado, el valor predictivo negativo es 

$$\text{PV}- = \frac{1218}{1218 + 4} \approx 0.997,$$

luego un individuo que obtenga un resultado negativo tiene una probabilidad del 0.997 de no estar infectado verdaderamente por el VIH.

