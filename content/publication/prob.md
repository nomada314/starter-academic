+++
title = "Introducción al Cálculo de Probabilidades para Estudiantes de Ingeniería"
date = "2025-04-26"
authors = ["admin"]
publication_types = ["5"]
abstract = "El propósito de este libro es servir de texto guía en cursos de probabilidad para estudiantes de ingeniería. Por esta razón, los conceptos presentados son principalmente aplicados a la solución de problemas en diversos campos de la ingeniería. En el primer capítulo se presentan los conceptos básicos de matemáticas que facilitarán la comprensión del resto del material presentado. En el segundo capítulo se presentan las definiciones básicas de probabilidad y probabilidad condicional, junto a las principales reglas para hacer cálculos de probabilidades. En el tercer capítulo se introduce el concepto de variable aleatoria y cómo este nos permite modelar problemas básicos de ingeniería. También, se definen las funciones de distribución, probabilidad, fiabilidad y cuantil asociadas a una variable aleatoria. En el cuarto capítulo se presenta el concepto de esperanza matemática y cómo puede utilizarse para identificar funciones de distribución. Finalmente, el quinto capítulo presenta las distribuciones más comúnmente utilizadas en ingeniería para modelar problemas en los que hay elementos de incertidumbre. A lo largo del texto se utiliza *software* libre para realizar los cálculos y simulaciones."
image_preview = ""
math = true
highlight = true
url_pdf= "https://simehbucket.s3.amazonaws.com/miscfiles/introduccion-al-calculo-de-probabilidades-para-estudiantes-de-ingenieria_tnyo9b36.pdf"
doi='10.19053/uptc.9789586609449'
tags = ["Teaching", "Julia", "Probability"]
[header]
image = ""
caption = ""
+++


<img src="https://simehbucket.s3.amazonaws.com/images/415ebe2115322046c17eea718237c3c6-medium.jpg"  width="180"/>


[Más información](https://editorial.uptc.edu.co/gpd-introduccion-al-calculo-de-probabilidades-para-estudiantes-de-ingenieria-9789586609449-680d0a2fc352d.html)

<!--A continuación se encuentra el código utilizados en el libro en `Julia` (Próximamente en `Python` y `R` ).  Finalmente, se encuentran los errrores encontrados a la fecha.-->

## Código

Capítulo | `Julia` | `Python` | `R` |
:--------|:-------:|:-------:|:-------:|
Preliminares | [.ipynb](https://alexrojas.netlify.app/code/prob/probCap1.ipynb) | | |
Elementos básicos de probabilidad | [.ipynb](https://alexrojas.netlify.app/code/prob/probCap2.ipynb) | | |
Variables aleatorias y distribuciones |  | | |
Esperanza matemática|  | | |
Distribuciones especiales|  | | |

## Errata

### Capítulo 1.

p. 30: Nota "</> `Ib()`". Debe ser `Ib(0)` y `Ib(0.25)` en lugar de `Ia(0)` y `Ia(0.25)`, respectivamente.

### Capítulo 4. 

p. 219. La última frase de la sección 4.1 sobra. Se menciona que se consideran más ejemplos, pero estos no fueron incluidos.



