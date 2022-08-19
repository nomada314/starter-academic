+++
title = "Una Introducción Concisa a la Inferencia Estadística"
date = "2020-05-05"
authors = ["López A.", "admin"]
publication_types = ["5"]
publication = "Editorial UPTC"
publication_short = ""
abstract = "Este libro es una introducción práctica a la inferencia estadística, con abundancia y variedad de ejemplos reales y simulados que le permitirán a quien lee usar fácilmente los conceptos aprendidos. Los ejemplos que requieren cálculos numéricos son implementados en el *software* libre `R` y el código usado también está disponible para quien quiera replicar los ejemplos. Además del enfoque clásico de inferencia, se incluye el enfoque bayesiano para resolver problemas de estimación. Dando así herramientas para abordar problemas prácticos desde otra perspectiva.Para entender mejor el material en este libro, nuestros lectores deben tener conocimiento de funciones de probabilidad, unciones de distribución, variables aleatorias y convergencia, que usualmente se abordan en un curso básico de teoría de probabilidad. Igualmente, es aconsejable que nuestros lectores puedan resolver problemas de cálculo diferencial e integral."
image_preview = ""
math = true
highlight = true
tags = ["Teaching", "Inference","R"]
[header]
image = "IEfig33.png"
caption = "Figura 3.3."
+++


<center><img src="https://simehbucket.s3.amazonaws.com/images/ecbf39cc05c48884b1f7d533b115ef50-medium.jpg" width="250">
  
Disponible en [RedBooks](https://www.redbooks.com.co/product/una-introduccion-concisa-a-la-inferencia-estadistica/)
</center>


## Datos

* [Precio acción simulado](https://alexrojas.netlify.com/Data/Inf/PrecioAccionSimulado.csv): Ejemplo 1.40
* [Precipitación tormentas en verano](https://alexrojas.netlify.com/Data/Inf/LluviaIllinois.csv): Ejemplos 2.2, 2.22, 2.32, 2.40, 2.49, 4.20 y 4.22
* [Goles de campo en la NFL 1995-96](https://alexrojas.netlify.com/Data/Inf/nflK.csv): Ejemplos 2.51 y 4.17
* [Lesiones craneales en la NFL 2012-15](https://alexrojas.netlify.com/Data/Inf/NFL.csv): Ejemplo 2.63
* [Verizon](https://alexrojas.netlify.com/Data/Inf/Verizon.csv): Ejemplo 3.17

## Código en R

* [Capítulo 1.](https://alexrojas.netlify.com/code/Inf/Infcap1.R) Preliminares
* [Capítulo 2.](https://alexrojas.netlify.com/code/Inf/Infcap2.R) Estimación puntual
* [Capítulo 3.](https://alexrojas.netlify.com/code/Inf/Infcap3.R) Contraste de hipótesis
* [Capítulo 4.](https://alexrojas.netlify.com/code/Inf/Infcap4.R) Estimación por regiones

## Errata

#### Capítulo I
* p. 2, quinta línea, segundo párrafo: la función de probabilidad debe ser denotada por $f_{\mathbf{X}}(\mathbf{x}|\pmb{{\theta}})$, no por $f_{\mathbf{X}}(x|\pmb{{\theta}})$
* p.3, Ejemplo 1.3: $g(\alpha,\beta) = \alpha/\beta$ en lugar de $g(\alpha,\beta) = \alpha\beta$.
* p. 5, Ecuación (1.3): la integración es con respecto a $u$, no $x$.
* p. 7, Primera ecuación: falta incluir que $r\in(0,2\sqrt{3}\sigma$.
* p. 7, Definición 1.3: es auxiliar, no auxilliar.
* p. 9, Ejemplo 1.2: En el cálculo de $f_{T,R}(t,r)$, en la primera igualdad el jacobiano es $r$, no $s$. En la tercera línea no es $y$, debe ser $r$. Es decir, $h(r) = \frac{\lambda^n}{\Gamma(n)}r^{n-1}e^{-\lambda r}I_{(0,\infty)}(r)$.
* p. 13, Ejemplo 1.18, penúltima línea: debe ser "$(X_1,X_2)|T(\mathbf{X})$ toma valores $\ldots$" en lugar de "$\Pr((X_1,X_2)|T(\mathbf{X}))$ toma valores $\ldots$".
* p. 20, A la función $c(\theta)$ falta dividirla por $\sigma$.
* p. 21, Ejemplo 1.35: En el primer exponencial de la tercera línea hace falta un $-$, es decir, debe ser $\exp{\left(-\frac{n\mu^2}{2\sigma^2}\right)}$.
* p. 23, Figura 1.5: La leyenda está invertida.
* p. 23, Párrafo antes del Teorema 1.6: debe ser "razonable".
* p. 24, Ejemplo 1.38: debe ser asintótica en lugar de asimptótica.
* p. 24, Figura 1.6: La leyenda está invertida.
* p. 24, Sección 1.5, segunda línea: debe ser distribuida $X_1, \ldots, X_B$ en lugar de distruida $X_1, \ldots, X_n$.
* p. 31, Ejercicio 1.10: debe ser asintótica en lugar de asimptótica.
* p. 32, Ejercicio 1.11: debe ser asintótica en lugar de asimptótica.
* p. 32, Ejercicio 1.15:  $W = X + Y + Z$.


#### Capítulo II
* p. 36, Segunda línea: vector de parámetros en lugar de vector de parámteros.
* p. 37, Párrafo después de la Definición 2.1: En la cuarta línea debe ser cúal, en lugar de cuál.
* p. 37, Segundo párrafo después de la Definición 2.1: En la primera línea debe ser cómo, en lugar de como.
* p. 38, Ejemplo 2.5: en el último término en la segunda línea del cálculo de $\mathbb{E}[S^2]$ debe emplearse paréntesis cuadrados, $\mathbb{E}[\overline{X}^2]$.
* p. 40, En la última expresión para $\mathbb{V}_{\theta}(T(X))$ es un signo menos, en lugar de un signo más.
* p. 46, En la última línea: Mood *et al.* (1974, p. 326) en lugar de Mood *et al.* (1974, ,p.326).
* p. 50, En la última ecuación, en la indicadora debe cambiarse $t$ por $\tau$.
* p. 51, Ejemplo 2.19: en la expansión de Maclaurin debe usarse $\lambda/n$ en lugar de $n/\lambda$.
* p. 52, En la última línea debe incluirse "de variables aleatorias" entre las palabras "muestra" e "independiemnte". 
* p. 57, Figura 2.5, la cantidad de muestras *bootstrap* son 10000, no 1000.
* p. 61, Ejemplo 2.26, la definición de $Y$ debe ser $Y=I_{[-1,0)}(X)$ y $\widehat{p}$ es la proporción de electrones que van hacia atrás.
* p. 75, Ecuación 2.8: el último término dentro del radical es positivo, no negativo.
* p. 75, Figura 2.15, panel derecho: la figura presenta $-S(\theta)$, no $-S(\theta)$.
* p. 77, Ejemplo 2.41: el factor inicial en la productoria en la función de log-verosimilitud es para $i = 1$. 
* p. 100, novena línea: Debe ser $E_{\theta^{(0)}}(\log k(\mathbf{Z}|\theta,\mathbf{X}))$, no $E_{\theta^{(0)}}(\log k(\theta|\mathbf{X}))$.
* p. 117, Ejemplo 2.60: En la primera ecuación debe ser $\lambda$ en lugar de $\theta$.
* p. 128, El código usado en el **Ejemplo 2.69** aparece fuera de las márgenes. Sin embargo, este código se encuentra en el [código del segundo capítulo](https://alexrojas.netlify.com/code/Inf/Infcap2.R).
* p. 135, Ejemplo 2.72: El límite inferior de la segunda integral en la primera ecuación debe ser $-\infty$ en lugar de $\infty$. Además, el código calcula $\Pr(Z \geq 3)$, para que calcule $\Pr(Z \geq 3.5)$ se debe reemplazar la constante 3 por 3.5 en este código.
* p. 146, Ejercicio 2.2: $T(\mathbf{X})$ es $\frac{n+1}{2(n-1)\sqrt{3}}\cdot (X_{(n)}-X_{(1)})$.

#### Capítulo III
* p. 154, segunda línea: debe decir "regla de decisión", no "regla decisión".
* p. 154, Ejemplo 3.1: Debe ser $\beta(1.5) = \Pr(c < X < 1.5|\theta = 1.5)$ en lugar de $\beta(1.5) = \Pr(c < X < 1.5|\theta = 1)$
* p. 157, Ejemplo 3.3: para $T(X)$ el exponente de la función exponencial debe ser $-n(\lambda_1-\lambda_0)\overline{X}$ en lugar de $-n(\lambda_0-\lambda_1)\overline{X}$
* p. 158, Ejemplo 3.4: falta un paréntesis en el denominador y un menos en el denominador en la tercera expresión. La expresión correcta es $\frac{4^{-1}e^{-|X|/2}}{(\sqrt{2\pi})^{-1}e^{-X^2/2}} $
* p. 168, Definición 3.8: Debe ser $\Lambda > k$
* p. 168, Ejemplo 3.11: se usó $1/\Lambda(X)$ en lugar de $\Lambda(X)$
* p. 169, Ejemplo 3.12: se usó $1/\Lambda(X)$ en lugar de $\Lambda(X)$
* p. 171, Ejemplo 3.13: en la primera fórmula en lugar de $\mu$ debe ser $\bar{x}$
* p. 178, Ejemplo 3.20: $W = \sqrt{n}\overline{X}\left(\frac{1}{\overline{X}}-\lambda_0\right)$ en lugar de $W = \sqrt{n}\lambda_0\left(\frac{1}{\overline{X}}-\lambda_0\right)$, luego $W = -0.704$.


#### Apéndice C
* p. 232, en la definición de la función de probabilidad de densidad de la exponencial$(\theta,\lambda)$: debe aparecer $x$, en lugar de $x_i$ y $\theta \in \mathbb{R}^{+}$.  
* p. 236, se define la función de densidad de probabilidad de una Gamma$(\alpha, \beta)$, no Gamma$(\alpha, \lambda)$

#### Apéndice C
* p. 252, prueba del Teorema de Glivenko-Cantelli: La convergencia de $F_n(t_j)$ a $F(t_j)$ se da en el Teorema 1.5, no en "en el teorema anterior". Además, en la novena línea de la prueba existe un error tipográfico y debe ser $F(t_{j-1}) \leq F(t) \leq F(t_{j})$ y $F_{n}(t_{j-1}) \leq F_{n}(t) \leq F_{n}(t_{j})$


