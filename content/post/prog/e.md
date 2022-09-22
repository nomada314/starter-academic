+++
date      = 2021-09-22
lastmod   = 2021-09-22
draft     = false
title     = "Examen I"
math      = true
+++

1. [5] Escriba una función en `Python` que calcule $f(x) = x^3 + x^2 -2$.
2. Dado un conjunto de $n+1$ puntos $(x_0,y_0), \ldots,(x_{n},y_{n})$ se quiere estimar el valor de $y(x)$ encontrando una curva que pase por todos los $n+1$ puntos, es decir, se quiere llevar a cabo una interpolación. La forma más simple de interpolar es por medio de un polinomio de grado $n$. Para esto acudimos a la fórmula de Lagrange: 

$$
P_n(x) = \sum_{i=0}^n y_i l_i(x),
$$

donde

$$l_i(x)  = \prod_{j=0, j\neq i}^n \frac{x-x_j}{x_i-x_j}, \quad i = 0,1, \ldots, n.$$

Implemente en `Python` la fórmula de Lagrange para $n =2$. Su función debe tres argumentos y llamerse `inter`. El primer argumento debe serl el valor de $x$ donde se quiere interpolar. El segundo argumento es un arreglo `numpy` con los valores en observados en $x$. El tercer argumento es un arreglo `numpy` con los valores en observados en $y$.

3. Seleccione tres números en el intervalo $[1,5]$ al azar y almacenelos en el arreglo numpy `xObs`. Estos son sus valores observados para $x$ y evalue la función $f(x) = x^3 + x^2 -2$, empleando la función escrita en el numeral 1, para obtener los valores observados en $y$. Almacene estos valore en `yObs`. Genere una figura en la que aparezca la función $f(x) = x^3 + x^2 -2$ con dominio $[1,5]$. Adicione a esta figura los tres puntos observados. Y, finalemente, utilice la función para interpolar los valores de la función en los puntos 1.5, 2.5 y 4.5, y adicionelos en la figura. 

4.
5.


