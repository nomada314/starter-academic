+++
date      = 2024-09-19
lastmod   = 2024-09-19
draft     = true
title     = "Examen I"
math      = true
+++


Lea la hoja de cálculo `Normalized_Data` en el archivo `minas.xls` ubicado en la página https://alexrojas.netlify.app/Data/Prob/minas.xls

Este conjunto de datos fue obtenido por Yilmaz, C., Kahraman, H. T., & Söyler, S. (2018). Para seis diferentes tipos de suelo y diferente clases de minas, se midió, utilizando un sensor *fluxgate*, el voltaje debido a la distorción magnética a diferentes alturas del suelo. Las columnas en el conjunto de datos son $V$: voltaje, $H$: altura del sensor sobre el suelo, $S$: tipo de suelo y $M$: tipo de mina.  Los tipos de minas son: `1`: no mina, `2`: anti-tanque, `3`: anti-personal, `4`: "trampa cazabobos" anti-personal , `5`: M14 anti-personal. Los tipos de suelos son `0`: arenoso seco, `0.2`: humus seco, `0.4`: con cal seco, `0.6`: arenoso húmedo, `0.8`: humus húmedo, `1.0`: con cal húmedo. 

Realice las siguientes manipulciones: 
* [5] Transforme los valores de la columna $S$ para que tome los valores $1, 2, 3, 4, 5, 6$ en lugar de $0, 0.2, 0.4, 0.6, 0.8, 1.0$, respectivamente. Almacenelos en la columna `suelo`. **Cuando termine llame al instructor**
* El siguiente código convierte la variable `suelo` en una variable categórica. Ejecútelo cambiando  `m` por el nombvre que usted le haya dado al conjunto de datos. 

```{python}
m['suelo'] = m['suelo'].astype("category")
m['suelo'] = m['suelo'].cat.rename_categories({1.0: "Seco-arenoso", 2.0: "Seco-humus", 3.0: "Seco-cal", 4.0:"Húmedo-arenoso", 5.0:"Húmero-humus", 6.0:"Húmedo-cal"})
```

* [5] Convierta en variable categórica el tipo de mina (`M`). **Cuando termine llame al instructor**


Conteste las siguientes preguntas:
1. [15] El coeficiente de variación se una medida de dispersión invariante a la escala de medición y  está definido como $$\rm{CV} = \frac{s}{\bar{X}},$$ donde $\bar{X}$  es la media muestral y $s$ es la desviación estándar muestral. Calcule y escriba en la hoja de respuestas el coeficiente de variación de la variable $V$ para cada tipo de mina. ¿Cuál es el tipo de mina con mayor variación en el voltaje detectado con el sensor?
2. [10] Elabore un gráfico en el que en el eje $x$ se presente el tipo de suelo y en el eje $y$ la distribución del voltaje. Escriba en su hoja de respuestas los tipos de suelos para los cuales hay observaciones atípicas.  **Cuando termine llame al instructor**
3. [15] Grafique un diagrama de cajas del voltaje para cada tipo de mina, solo con las mediciones hechas para el tipo de suelo `Seco-humus`. Con base en este gráfico, ¿para qué tipo de mina el voltaje promedio es más grande que el resto de minas? **Cuando termine llame al instructor**
4. [15] A continuación se presenta la Figura 4 del artículo fuente de los datos. Geenere esta gráfica. Los valores del voltaje en el conjunto de datos han sido modificados; así que, los valores 
5. 
Referencia: Yilmaz, C., Kahraman, H. T., & Söyler, S. (2018). Passive mine detection and classification method based on hybrid model. IEEE Access, 6, 47870-47888.
