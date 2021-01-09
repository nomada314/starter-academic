+++
title = "Una Introducción Concisa a la Inferencia Estadística"
date = "2020-07-13"
authors = ["López A.", "admin"]
publication_types = ["5"]
publication = "Editorial UPTC"
publication_short = ""
image_preview = ""
math = true
highlight = true
tags = ["Teaching", "Inferencia"]
[header]
image = ""
caption = ""
+++

Disponible en [RedBooks](https://www.redbooks.com.co/libreria/matematicas-y-ciencias-naturales/826-una-introduccion-concisa-a-la-inferencia-estadistica.html)

## Datos

* [Precio acción simulado](https://alexrojas.netlify.com/Data/Inf/PrecioAccionSimulado.csv): Ejemplo 1.40
* [Precipitación tormentas en verano](https://alexrojas.netlify.com/Data/Inf/LluviaIllinois.csv): Ejemplos 2.2, 2.22, 2.32, 2.40, 2.49, 4.20 y 4.22
* [Goles de campo en la NFL 1995-96](https://alexrojas.netlify.com/Data/Inf/nflK.csv): Ejemplos 2.51 y 4.17
* [Lesiones craneales en la NFL 2012-15](https://alexrojas.netlify.com/Data/Inf/NFL.csv): Ejemplo 2.63
* [Verizon](https://alexrojas.netlify.com/Data/Inf/Verizon.csv): Ejemplo 3.17

## Código

* [Capítulo 1.](https://alexrojas.netlify.com/code/Inf/Infcap1.R) Preliminares
* [Capítulo 2.](https://alexrojas.netlify.com/code/Inf/Infcap2.R) Estimación puntual
* [Capítulo 3.](https://alexrojas.netlify.com/code/Inf/Infcap3.R) Contraste de hipótesis
* [Capítulo 4.](https://alexrojas.netlify.com/code/Inf/Infcap4.R) Estimación por regiones

## Muestra de árboles sembrados

<table style="width:100%">
  <tr>
    <th><img src="https://alexrojas.netlify.app/media/manodeoso.png" width="50" height="70"></th>
    <th><img src="https://alexrojas.netlify.app/media/roble.png" width="50" height="70"></th>
    <th><img src="https://alexrojas.netlify.app/media/yarumo.png" width="50" height="70"></th>
  </tr>
  <tr>
    <td>[Mano de oso (Oreopanax bogotensis)](https://es.wikipedia.org/wiki/Oreopanax_bogotensis)</td>
    <td>[Roble (Quercus humboldtii)](https://es.wikipedia.org/wiki/Quercus_humboldtii)</td>
    <td>[Yarumo (Cecropia peltata)](https://es.wikipedia.org/wiki/Cecropia_peltata)</td>
  </tr>
</table>

<img src="https://alexrojas.netlify.app/media/manodeoso.png" width="50" height="70"> | 
<img src="https://alexrojas.netlify.app/media/roble.png" width="50" height="70"> | 
<img src="https://alexrojas.netlify.app/media/yarumo.png" width="50" height="70">
:---:|:---:|:---:
[Mano de oso (Oreopanax bogotensis)](https://es.wikipedia.org/wiki/Oreopanax_bogotensis) | [Roble (Quercus humboldtii)](https://es.wikipedia.org/wiki/Quercus_humboldtii)| [Yarumo (Cecropia peltata)](https://es.wikipedia.org/wiki/Cecropia_peltata) 
![Garrocho](https://alexrojas.netlify.app/media/garrocho.png =50x50)| ![Raque](https://alexrojas.netlify.app/media/Raque.jpg =50x50) | ![Gaque](https://alexrojas.netlify.app/media/gaque.png =50x50)
[Garrocho (Viburnum triphyllum)](https://es.wikipedia.org/wiki/Viburnum_triphyllum) | [Raque (Vallea stipularis)](https://es.wikipedia.org/wiki/Vallea_stipularis)| [Gaque (Clusia multiflora)](https://es.wikipedia.org/wiki/Clusia_multiflora) 


## Errata

* p. 2, quinta línea, segundo párrafo: la función de probabilidad debe ser denotada por $f_{\mathbf{X}}(\mathbf{x}|\pmb{{\theta}})$, no por $f_{\mathbf{X}}(x|\pmb{{\theta}})$
* p. 5, Ecuación (1.3): la integración es con respecto a $u$, no $x$
* p. 36, segunda línea: vector de parámetros en lugar de vector de parámteros
* p. 46, última línea: Mood *et al.* (1974, p. 326) en lugar de Mood *et al.* (1974, ,p.326)
* p. 100, novena línea: Debe ser $E_{\theta^{(0)}}(\log k(\mathbf{Z}|\theta,\mathbf{X}))$, no $E_{\theta^{(0)}}(\log k(\theta|\mathbf{X}))$
* p. 128: El código usado en el **Ejemplo 2.69** aparece fuera de las márgenes. Sin embargo, este código se encuentra en el [código del segundo capítulo](https://alexrojas.netlify.com/code/Inf/Infcap2.R)
* p. 252, prueba del Teorema de Glivenko-Cantelli: La convergencia de $F_n(t_j)$ a $F(t_j)$ se da en el Teorema 1.5, no en "en el teorema anterior". Además, en la novena línea de la prueba existe un error tipográfico y debe ser $F(t_{j-1}) \leq F(t) \leq F(t_{j})$ y $F_{n}(t_{j-1}) \leq F_{n}(t) \leq F_{n}(t_{j})$

