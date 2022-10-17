+++
date      = 2022-10-17
lastmod   = 2022-10-17
draft     = false
title     = "Examen II"
math      = true
+++

Vamos a calcular el área de un polígono de dos maneras. Podemos representar un polígono con $n$ vértices utilizando un arreglo `NumPy` con forma `(n,2)`. De ahora en adelante, nos referimos a los valores en la primera columna como las coordenadas en el eje $x$ y en la segunda columna como las coordenadas en el eje $y$.


1. [10] Dado un arreglo con forma `(n,2)`, organizamos en forma ascendente el arreglo utilizando las coordenadas en el eje $y$. **Ayuda** considere el método `argsort()`.
2. [15] Encuentre el punto medio. Es decir, encuentre $$p = \left(\frac1n\sum_{i=1}^n{x_i}, \frac1n\sum_{i=1}^n{y_i}\right)$$.
3. [25] De los $n$ puntos originales, elimine todos menos los 5 puntos más distantes al punto medio. **Ayuda:** una manera de hacerlo es utilizar la función `np.concatenate()` para combinar los puntos originales y el punto medio en un solo arreglo. Luego, utilizar la función `distEuclidiana()`, definida al final de esta página, para encontrar las distancias entro estos puntos. Finalmente, seleccionar los 5 puntos más lejano al punto medio (de nuevo, considerel método `.argsort()`. 
4. [25] Defina una nueva función llamada `distNueva()` que calcule la "distancia" $d^{\star}$ para todos los puntos en un arreglo con forma `(n,2)`, con $$d^{\star}( (w_1,w_2) , (z_1,z_2)) = |w_1-z_1| + 2|w_2-z_2|.$$ Utilice su función para calcular la "distancia" $d^{\star}$ para los 5 puntos encontrados en el anterior numeral. **Ayuda:** modifique solamente la cuarta línea de la función `distEuclidiana()`.
5. Cree una lista llamada `orden`, donde almacenaremos $5$ enteros. Inicialice esta lista con el entero `0`, es decir, `orden = [0]`.
6. [5] Al punto con la mínima coordenada en el eje $y$ lo denotamos por $(x_0,y_0)$.  Encuentre el punto más cercano a $(x_0,y_0)$ utilizando la distancia $d^{\star}$, al cual denotamos como $(x_1,y_1)$, y añada a la lista `orden` la posición original de $(x_1,y_1)$. 
7. [10] Repita 3 veces más numeral 6 de la siguiente manera. Para $i = 2,\ldots,4$, encuentre el punto más cercano a $(x_{i-1},y_{i-1})$ sin considerar los puntos correspondientes a los índices incluidos en la lista llamada `orden`.
8. Almacene en el arreglo `c1` las coordenadas de los cinco puntos más cercanos al centro en orden. Es decir $$c1 = \begin{pmatrix}
x_0 & y_0\\
x_1 & y_1\\
x_2 & y_2\\
x_3 & y_3\\
x_4 & y_4\\ 
\end{pmatrix}$$
9. [10] Con base en el arreglo `c1`, cree el arreglo `c2` con forma `(6,2)` donde las primeras 5 filas de `c2` son iguales a `c1` y la última fila es igual a la primera fila de `c1`. Sin utilizar ciclos, calcule $$\frac12|S_1 - S_2|$$ donde $$S_1 = x_1y_2 + x_2y_3 + \cdots+ x_5y_1$$ y $$S_2 = y_1x_2 + y_2x_3 + \cdots + y_5x_1.$$ **Ayuda:** considere la función `np.concatenate()`


```{python}
def distEuclidiana(X):
    n, p = X.shape
    diferencias = X.reshape(n,1,p) - X
    distancias = (diferencias**2).sum(axis=2)
    np.fill_diagonal(distancias, np.Inf)
    return distancias
```

