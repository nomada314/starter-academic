+++
date      = 2021-10-17
lastmod   = 2021-10-17
draft     = true
title     = "Examen II"
math      = true
+++

Vamos a calcular el área de un polígono de dos maneras. Podemos representar un polígono con $n$ vértices utilizando un arreglo `NumPy` con forma `(n,2)`. De ahora en adelante, nos referimos a los valores en la primera columna como las coordenadas en el eje $x$ y en la segunda columna como las coordenadas en el eje $y$.


1. [10] Dado un arreglo con forma `(n,2)`, organizamos en forma ascendente el arreglo utilizando las coordenadas en el eje $y$. **Ayuda** considere la función `argsort()`.
2. [5] Cree un arreglo unidimensional llamado `orden`, donde almacenaremos $n$ enteros. Inicialice este arreglo con ceros.
3. [5] Al punto con la mínimia coordenada en el eje $y$ lo denotamos por $(x_0,y_0)$.  Encuentre el punto más cercano a $(x_0,y_0)$, al cual denotamos como $(x_1,y_1)$,  y asígnele a `orden[1]` la posición original de $(x_1,y_1)$.
4. Repita el numeral 3 de la siguiente manera. Para $i = 2,\ldots,n - 1$, encuentre el punto más cercano a $(x_{i-1},y_{i-1})$ sin considerar los puntos correspondientes a los índices en el vector `orden`.



1. [5] Escriba una función en `Python` que calcule $f(x) = x^3 + x^2 -2$.
2. [15] Dado un conjunto de $n+1$ puntos $(x_0,y_0), \ldots,(x_{n},y_{n})$ se quiere estimar el valor de $y(x)$ encontrando una curva que pase por todos los $n+1$ puntos, es decir, se quiere llevar a cabo una interpolación. La forma más simple de interpolar es por medio de un polinomio de grado $n$. Para esto acudimos a la fórmula de Lagrange: 
$$P_n(x) = \sum_{i=0}^n y_i l_i(x),$$
donde
$$l_i(x)  = \prod_{j=0, j\neq i}^n \frac{x-x_j}{x_i-x_j}, \quad i = 0,1, \ldots, n.$$
Implemente en `Python` la fórmula de Lagrange para $n =2$. Su función debe tres argumentos y llamerse `inter`. El primer argumento debe serl el valor de $x$ donde se quiere interpolar. El segundo argumento es un arreglo `numpy` con los valores observados en $x$. El tercer argumento es un arreglo `numpy` con los valores en observados en $y$.

3. [15] Seleccione tres números en el intervalo $[1,15]$ al azar y almacenelos en el arreglo numpy `xObs`. Estos son sus valores observados para $x$. Evalue la función $f(x) = x^3 + x^2 -2$, empleando la función escrita en el numeral 1, para obtener los valores observados en $y$. Almacene estos valores en `yObs`. Genere una figura en la que aparezca la función $f(x) = x^3 + x^2 -2$ con dominio $[0,15]$. Adicione a esta figura los tres puntos observados. Utilice la función para interpolar los valores de la función en los puntos $x= 6, 7, 8$, y adicionelos en la figura. 

4. [30] Sea
$$f_n(x) = x(1-x)\mbox{sen}{(n \pi x)}.$$
Grafique $f_4(x)$ y $f'_4(x)/6$ en una sola figura para $x\in [0,0.5]$.  Para encontrar la derivada, debe emplear `SymPy`.

5. [35] Escriba una función en `Python` para que dada una lista con los coeficientes de un polinomio, retorne su matriz compañera.  Dado un polinomio
$$p(x) = a_0 + a_1x + a_2x^2 +\ldots + a_{m-1}x^{m-1}+ x^m, $$
la función recibe como argumento la lista o arreglo $[a_0, a_1,\ldots,a_{m-1},1]$ y reporta la matriz compañera de $p(x)$: 
$$
\begin{pmatrix}
\mathbf{0}\_{m} & -a_{0}\\
\mathbf{I}\_{m} & \mathbf{R} 
\end{pmatrix}
$$
donde $\mathbf{I}_m$ es la matriz identidad de tamaño $m\times m$, $\mathbf{0}_{m}$ es el vector de ceros de tamaño $1\times m$, y $\mathbf{R}$ es el vector $(-a_{1}, -a_{2}, \ldots, -a_{m-1} )^T$. En caso de que el coeficiente de $x^m$ sea diferente a 1, la función devuelve la matriz compañera del polinomio con coeficientes $[a_0/a_m, a_1/a_m,\ldots,a_{m-1}/a_m,1]$.

