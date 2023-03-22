+++
date      = 2023-03-22
lastmod   = 2023-03-22
draft     = false
title     = "Examen II"
math      = true
+++

Importe los datos disponibles en https://alexrojas.netlify.com/Data/Prob/chicago_taxi.txt

1. [15] Cree una diagrama de barras agrupadas en el que se muestre la proporción de pagos hechos con tarjeta y en efectivo por tipo de día. En su gráfica, debe aparecer las etiquetas "Día hábil" y "Fin de semana" para la variable `daytype` y "Efectivo" y "Tarjeta" para `payment_type`. Con base en la gráfica anterior, indique para que tipo de día la proporción de pagos en efectivo es mayor.
2. [20] Cree la variable `Tráfico`, la cual toma el valor "Trancón" cuando `seconds` es mayor que 200 + 750 * `miles`, "Despejado" cuando `seconds` es menor que 250 * `miles` y "Normal" en otro caso. Encuentre el promedio y desviación estándar de tiempo en segundos para cada categoría de la variable `Tráfico`, sin tener en cuenta viajes con tiempos superiores a 20000 segundos.
3. [20] Cree un gráfico de barras y líneas con la información del numeral anterior.
4. [10] Grafique un diagrama de cajas para el **logaritmo** de la variable `speed` por `Tráfico`, sin considerar viajes de más de 7.68 millas y 1200 segundos.
5. [10] Cree un diagrama de dispersión de `seconds` versus `miles` sin considerar viajes de más de 7.68 millas y 1200 segundos. El color de los puntos esté dado por la variable `Tráfico` y el tamaño por la variable `speed`. 
6. [10] Calcule el porcentaje del total que corresponde a la propina, nombre esta variable `prop`. Cree un diagrama de dispersión de `prop` vs. el logaritmo de `seconds`, sin considerar los recorridos en los que la propina fue `0`.
7. [15] Cree un gráfico con el que se pueda concluir cuándo es más probable un tipo de pago, dado que no se dio propina.


