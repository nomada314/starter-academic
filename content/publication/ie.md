+++
title = "Una Introducción Concisa a la Inferencia Estadística"
date = "2020-05-05"
authors = ["López A.", "admin"]
publication_types = ["5"]
publication = "Editorial UPTC"
publication_short = ""
image_preview = ""
math = true
highlight = true
tags = ["Teaching", "Inferencia"]
[header]
image = "IEfig33.png"
caption = "Figura 3.3."
+++


<center><img src="https://alexrojas.netlify.app/media/IEcaratula.png" width="250">
  
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

## Muestra de árboles sembrados

<table style="width:100%">
  <tr>
    <th><img src="https://alexrojas.netlify.app/media/roble.png" width="250"></th>
    <th><img src="https://alexrojas.netlify.app/media/manodeoso.png" width="250"></th>
    <th><img src="https://alexrojas.netlify.app/media/garrocho.png" width="250" height="350"></th>
  </tr>
  <tr>
    <td>Roble (Quercus humboldtii)</td>
    <td>Mano de oso (Oreopanax bogotensis)</td>
    <td>Garrocho (Viburnum triphyllum)</td>
  </tr>
  <tr>
    <th><img src="https://alexrojas.netlify.app/media/gaque.png" width="250" height="350"></th>
    <th><img src="https://alexrojas.netlify.app/media/Raque.jpg" width="250" height="350"></th>
    <th><img src="https://alexrojas.netlify.app/media/yarumo.png" width="250"></th>
  </tr>
  <tr>
    <td>Gaque (Clusia multiflora)</td>
    <td>Raque (Vallea stipularis)</td>
    <td>Yarumo (Cecropia peltata)</td>
  </tr>
</table>


## Errata

#### Capítulo I
* p. 2, quinta línea, segundo párrafo: la función de probabilidad debe ser denotada por $f_{\mathbf{X}}(\mathbf{x}|\pmb{{\theta}})$, no por $f_{\mathbf{X}}(x|\pmb{{\theta}})$
* p. 5, Ecuación (1.3): la integración es con respecto a $u$, no $x$
* p. 13, Ejemplo 1.18, penúltima línea: debe ser "$(X_1,X_2)|T(\mathbf{X})$ toma valores $\ldots$" en lugar de "$\Pr((X_1,X_2)|T(\mathbf{X}))$ toma valores $\ldots$".


#### Capítulo II
* p. 36, segunda línea: vector de parámetros en lugar de vector de parámteros
* p. 46, última línea: Mood *et al.* (1974, p. 326) en lugar de Mood *et al.* (1974, ,p.326)
* p. 100, novena línea: Debe ser $E_{\theta^{(0)}}(\log k(\mathbf{Z}|\theta,\mathbf{X}))$, no $E_{\theta^{(0)}}(\log k(\theta|\mathbf{X}))$
* p. 117, Ejemplo 2.60: En la primera ecuación debe ser $\lambda$ en lugar de $\theta$
* p. 128, El código usado en el **Ejemplo 2.69** aparece fuera de las márgenes. Sin embargo, este código se encuentra en el [código del segundo capítulo](https://alexrojas.netlify.com/code/Inf/Infcap2.R)
* p. 135, Ejemplo 2.72: El límite inferior de la segunda integral en la primera ecuación debe ser $-\infty$ en lugar de $\infty$. Además, el código calcula $\Pr(Z \geq 3)$, para que calcule $\Pr(Z \geq 3.5)$ se debe reemplazar la constante 3 por 3.5 en este código
* p. 146, Ejercicio 2.2: $T(\mathbf{X})$ es $\frac{n+1}{2(n-1)\sqrt{3}}\cdot (X_{(n)}-X_{(1)})$

#### Capítulo III
* p. 154, Ejemplo 3.1: Debe ser $\beta(1.5) = \Pr(c < X < 1.5|\theta = 1.5)$ en lugar de $\beta(1.5) = \Pr(c < X < 1.5|\theta = 1)$
* p. 168, Definición 3.8: Debe ser $\Lambda > k$
* p. 168, Ejemplo 3.11: se usó $1/\Lambda(X)$ en lugar de $\Lambda(X)$
* p. 169, Ejemplo 3.12: se usó $1/\Lambda(X)$ en lugar de $\Lambda(X)$
* p. 171, Ejemplo 3.13: en la primera fórmula en lugar de $\mu$ debe ser $\bar{x}$
* p. 178, Ejemplo 3.20: $W = \sqrt{n}\overline{X}\left(\frac{1}{\overline{X}}-\lambda_0\right)$ en lugar de $W = \sqrt{n}\lambda_0\left(\frac{1}{\overline{X}}-\lambda_0\right)$, luego $W = -0.704$.


#### Apéndice C
* p. 252, prueba del Teorema de Glivenko-Cantelli: La convergencia de $F_n(t_j)$ a $F(t_j)$ se da en el Teorema 1.5, no en "en el teorema anterior". Además, en la novena línea de la prueba existe un error tipográfico y debe ser $F(t_{j-1}) \leq F(t) \leq F(t_{j})$ y $F_{n}(t_{j-1}) \leq F_{n}(t) \leq F_{n}(t_{j})$


