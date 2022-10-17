+++
date      = 2022-10-17
lastmod   = 2022-10-17
draft     = true
title     = "Examen I- supletorio"
math      = true
+++

1. [35] Algunas compañías de tarjetas de crédito y varias oficinas de Gobierno usan el algoritmo de Luhn, o algoritmo de *módulo 10*, para distinguir entre números válidos y números con errores. Estos son los pasos para llevar a cabo la verificación: 
* Invierta la secuencia de números,
* para los números en las posiciones pares, aplique la siguiente función
$$ g(x) = \\left\\{
      \begin{array}{lcl}
      2x &\quad& \mbox{si } x\leq 4\\\\
      \\\\
      2x+1 \text{ mod } 10 &\quad& \mbox{si } x>4\\\\
      \end{array}
      \\right.
$$
y reemplace los valores originales por los valores obtenidos
*  sume los dígitos de la secuencia
*  si la suma módulo 10 es 0, el número es válido.
Escriba una función codificando este algoritmo para un número digitado como una cadena de caracteres. Por ejemplo, para verificar el número 413587652, el argumento debe escribirse así `'413587652'`. Si la cadena de caracteres digitada contiene un número válido, su función debe imprimir "Número válido", de otra manera imprimer "Número no válido".
2. [30] Sea
$$f_n(x) = x^2(1-x^2)\mbox{sen}{(n \pi x)}.$$
Grafique $f_4(x)$ y $f'_4(x)/10$ en una sola figura para $x\in [0,0.4]$.  Para encontrar la derivada, debe emplear `SymPy`.
3. [35] La concentración de iones de hidrógeno de una solución de ácido, $[\\mbox{H}^+]$, puede ser determinada mediante la siguiente aproximación iterativa $$[\\mbox{H}^+]\_{n+1} = \\sqrt{K\_a(c - [\\mbox{H}^+]\_{n})},$$ donde $K_a$ es la constante de desasociación del ácido, y $c$ es su concentración, con $[\\mbox{H}^+]\_{0}=0$. Las iteraciones continúan hasta que $[\\mbox{H}^+]\_{n+1} - [\\mbox{H}^+]\_{n}| < \delta$,  donde $\delta$ es un valor de tolerancia pequeño y predeterminado. Escriba una función que tome como argumentos `c`, `ka` y `delta` y calcule la concentración de iones de hidrógeno de una solución de ácido. Por defecto, $\delta = 0.01$. Emplee su función para determinar la concentración de iones de hidrógeno de una solución de ácido acético con $c = 0.01$ M y $K_a=1.78\times 10^{-5}$. También calcule su pH, utilizando la siguiente fórmula: $pH = -\log_{10}{[\mbox{H}^+]}$.

