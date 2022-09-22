+++
date      = 2021-09-22
lastmod   = 2021-09-22
draft     = true
title     = "Examen I"
math      = true
+++

1. [5] Escriba una función en `Python` que calcule $f(x) = x^3 + x^2 -2$.
2. [15] Dado un conjunto de $n+1$ puntos $(x_0,y_0), \ldots,(x_{n},y_{n})$ se quiere estimar el valor de $y(x)$ encontrando una curva que pase por todos los $n+1$ puntos, es decir, se quiere llevar a cabo una interpolación. La forma más simple de interpolar es por medio de un polinomio de grado $n$. Para esto acudimos a la fórmula de Lagrange: 
$$P_n(x) = \sum_{i=0}^n y_i l_i(x),$$
donde
$$l_i(x)  = \prod_{j=0, j\neq i}^n \frac{x-x_j}{x_i-x_j}, \quad i = 0,1, \ldots, n.$$
Implemente en `Python` la fórmula de Lagrange para $n =2$. Su función debe tres argumentos y llamerse `inter`. El primer argumento debe serl el valor de $x$ donde se quiere interpolar. El segundo argumento es un arreglo `numpy` con los valores en observados en $x$. El tercer argumento es un arreglo `numpy` con los valores en observados en $y$.

3. [15] Seleccione tres números en el intervalo $[1,15]$ al azar y almacenelos en el arreglo numpy `xObs`. Estos son sus valores observados para $x$ y evalue la función $f(x) = x^3 + x^2 -2$, empleando la función escrita en el numeral 1, para obtener los valores observados en $y$. Almacene estos valore en `yObs`. Genere una figura en la que aparezca la función $f(x) = x^3 + x^2 -2$ con dominio $[0,15]$. Adicione a esta figura los tres puntos observados. Y, finalemente, utilice la función para interpolar los valores de la función en los puntos 6, 7 y 8, y adicionelos en la figura. 

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

