+++
date      = 2017-10-21
lastmod   = 2017-10-21
draft     = false
tags      = ["Design Of Experiments"]
title     = "Superficies de Respuesta"
math      = true
+++

Los diseños de superficie de respuesta son usualmente usados en la última etapa de experimentación, luego los factores importantes ya han sido previamente determinados usando diseños de *filtración*, por experiencia, o teoréticamente.

La meta en esta etapa de la experimentación es describir en detalle la relación entre los factores y la respuesta.

# Conceptos y métodos

La metodología de superficie de respuesta (RSM)  se refiere al paquete completo de herramientas de diseño y análisis estadístico usadas para los siguientes tres pasos:

1. diseño y colección de los datos experimentales que permiten estimar un modelo cuadrático para ajustar y predecir,
2. análisis de regresión para seleccionar la mejor ecuación para describir los datos,
3. análisis de la superficie ajustada usando gráficos de contornos y otras herramientas gráficas y numéricas.


# Modelo cuadrático

Los análisis que se han hecho hasta ahora no han incluido curvas, así se incluyan interacciones. Sin embargo, esta representación de la realidad no siempre es la más adecuada. Cuando ya se han corrido algunos experimentos y se encontró que hay curvatura (presuntamente con un diseño factorial con puntos centrales), o cuando *apriori* se espera que haya una curvatura, entonces se deben correr suficientes experimentos para ajustar un modelo más complicado que permita ajustar esta curvatura.

En la siguiente figura se muestra el efecto que tiene diferentes términos a la ecuación polinomial. Note que el modelo más simple que permita curvatura es el modelo cuadrático.

![SR](/img/Quim/SR/CuadraticModel.png)
*Fuente:* Lawson and Erjavec (2017)

El modelo cuadrático para $k$ variables independientes es  

$$\hat{Y}=\beta\_0+\sum\_{i=1}^k\beta\_iX\_i+\sum\_{i=1}^k\beta\_{ii}X\_k^2+\sum\_{i=1}^{k-1}\sum\_{j=i+1}^k\beta\_{ij}X\_iX\_j$$

<!-- ![contornos](/img/Quim/SR/Contornos.png)
*Fuente:* Lawson and Erjavec (2017)-->

Este modelo, aunque simple, está en la capacidad de describir situaciones reales. Considere la concentración de un producto $P$ que puede ser modelada de la siguiente forma

$$P = R\_0\frac{k\_1}{k\_1-k\_2}\left\\{\exp{(-k\_1t)}-\exp{(-k\_2t)}\right\\},$$

donde las funciones de temperatura $k\_1$ y $k\_2$ están dadas por
$k\_1 = 0.5\exp{(-10000(1 / T - 1 / 400))}$ y
$k\_2 = 0.2\exp{(-12500(1 / T - 1 / 400))}$.


El modelo cuadrático ofrece una aproximación a la superficie bastante rasonable:
![3d1](/img/Quim/SR/3D1.png)

Pero si el **area de interés muy grande**, la aproximación falla completamente:

![3d0](/img/Quim/SR/3D0.png)


# Consideraciones del diseño

Características deseables en un diseño son:

1. distribución rasonable de los puntos,
2. se permite investigar si el modelo es adecuado,
3. se pueden realizar las corridas en bloques,
4. no se requiere un número grande de corridas,
5. permite estimar los coeficientes.  Para poder estimar los efectos cuadráticos se necesita tener al menos tres niveles para cada factor. La manera más simple seria tener un diseño factorial $3^k$, pero para un valor grande de $k$, se tendrían muchas corridas (*e.g.* $3^4=81$, que va en contra de 4.). Por otro lado, el número mínimo de corridas es $k+2\choose 2$, pero este número de corridas no permite estimar errores, luego los diseños más eficientes usualemente tienen entre 1.5 y el doble de estas corridas.


# Diseño central compuesto

Este diseño compienza con un diseño factorial $2^k$ que permite estimar

$$\hat{Y}=\beta\_0+\sum\_{i=1}^k\beta\_iX\_i+\sum\_{i=1}^{k-1}\sum\_{j=i+1}^k\beta\_{ij}X\_iX\_j.$$

Para permitir la estimación de los términos cuadráticos es necesario adicionar ($2^k$) puntos axiales (llamados puntos *estrella*) y $n\_c$ puntos centrales. Estos puntos axiales y centrales permiten corridas con tres niveles para cada variable independiente. Estos niveles son $-\alpha, 0, \alpha$ (donde $\alpha$ es la distancia del origen al punto axial en unidades codificadas). De esta manera se pueden estimar los coeficientes cuadráticos. El valor de $\alpha = \sqrt[4]{n\_F}$, donde $n\_F$ es el número de puntos en el diseño factorial.

$k$ | Número de corridas en el CCD | Coeficientes en el modelo cuadrático
--- | --- | ---
2   |  $2^2+4+6 = 14$ | ${4\choose 2} = 6$
3   |  $2^3+6+6 = 20$ | 10
4   |  $2^4+8+6 = 30$ | 15
5   |  $2^5+10+7 = 49$ | 21

## Ejemplo -- [Proceso de absorción del $\mathrm{CO}\_2$ de un biogás en una solución alcalina.] (https://revistas.unal.edu.co/index.php/dyna/article/view/13049/13743)

> Utilizando un diseño de experimentos tipo
factorial ampliado a DCC (diseño central
compuesto) se evaluaron los efectos de las
variables seleccionadas, concentración inicial
(relación Na_2CO$\_3$/NaHCO$\_3$) de la solución
alcalina, presión inicial en el reactor y
temperatura del sistema gas-líquido en la
absorción del CO2; representadas en la Tabla 1.
como variables codificadas A, B y C
respectivamente, con sus valores naturales
evaluados en los niveles de la experimentación.

Variable | -1 | 1 | -1.68 | 1.68 | 0 |
:---- | ----:| ----:| ----:| ----:| ----:|
A [$CO_3^=$/$HCO_3$] | 1.35  | 4.04 | 0.43 | 4.96 | 2.69|
B [mbar] | 1241.05 | 1861.58 | 1029.52 | 2073.12 | 1551.32|
C [°C] | 25 |35 |21.59 |38.40 |30|

A continuación se ingresan los datos usando la notación `-1` para el nivel bajo y `+1` para el nivel alto.
```{r}
unos <- c(-1,1)
co <- data.frame(A = rep(unos,4), B = rep(unos,2, each=2), C = rep(unos, each=4),
                 cambio = c(9.5744,14.1021, 8.8388, 14.2295, 10.1957, 18.0527,
                            9.5429,16.6059))
```

**Modelo $2^3$ con las variables codificadas** (Sección 3.1)

```{r}
modelo0 <- lm(cambio~A*C*B,data=co)
summary(modelo0)

modelo1 <- lm(cambio~A*C+B,data=co)
summary(modelo1)
```


```{r}
with(co, interaction.plot(A, C, cambio))
```

**Adicionar puntos centrales**
```{r}
pcentrales <- as.data.frame(cbind(0,0,0,c(11.0063,11.3211,10.5261,11.0952)))
names(pcentrales) = names(co); co <- rbind(co, pcentrales )
```
**Curvatura**
```{r}
Curv = mean(co$cambio[1:8]) - mean(co$cambio[9:12])
sc = sqrt(var(co$cambio[9:12])*(1/4+1/8))
tc = abs(Curv)/sc
cat("p-valor: ", 2*(pt(tc,3,lower.tail=FALSE)))
```

**Adicionar puntos axiales**

```{r}
alpha <- c(-1.68, 1.68) # round(8^(1/4),2)
paxiales <- data.frame(A=c(alpha,rep(0,4)),
                       B=c(0,0,alpha,0,0),
                       C=c(rep(0,4),alpha),
                       cambio = c(6.5599,14.675,12.1961,10.7009,9.2532,12.1545))
co <- rbind(co,paxiales)
co$A2 <- co$A^2; co$B2 <- co$B^2; co$C2 <- co$C^2
co$bloque<- as.factor(rep(1:2,c(12,6)))

modelo2 <- lm(cambio~bloque+A*B*C+A2+B2+C2,data=co) # Modelo completo
summary(modelo2)
modelo3 <- lm(cambio~bloque+A*C+B+A2+B2+C2,data=co) # Seleccionar solo las significativas
summary(modelo3)
```

**Modelo $2^3$ con las variables originales**

```{r}
co2 <- data.frame(A = rep(c(1.35,4.04),4), B = rep(c(1241.05,1861.58),2, each=2),
                  C = rep(c(25,35), each=4),
                  cambio = c(9.5744,14.1021, 8.8388, 14.2295, 10.1957, 18.0527,
                             9.5429,16.6059))
modelo4 <- lm(cambio~A+B+C+A:C,data=co2)
summary(modelo4) # Ecuación (5) del artículo
```


**Adicionar puntos centrales**

```{r}
pcentrales <- as.data.frame(cbind(2.69,1551.32,30,c(11.0063,11.3211,10.5261,11.0952)))
names(pcentrales) = names(co2)
co2 <- rbind(co2, pcentrales )
```

**Adicionar puntos axiales**

```{r}
pcentrales <- as.data.frame(cbind(2.69,1551.32,30,c(11.0063,11.3211,10.5261,11.0952)))
names(pcentrales) = names(co2)
co2 <- rbind(co2, pcentrales)

paxiales <- data.frame(A=c(c(0.43,4.96),rep(2.69,4)),
                       B=c(1551.32,1551.32,1029.52,2073.12,1551.32,1551.32),
                       C=c(rep(30,4),c(21.59,38.40)),
                       cambio = c(6.5599,14.675,12.1961,10.7009,9.2532,12.1545))
co2 <- rbind(co2,paxiales)

co2$A2 <- co2$A^2; co2$B2 <- co2$B^2; co2$C2 <- co2$C^2
co2$bloque<- as.factor(rep(1:2,c(12,6)))
modelo5 <- lm(cambio~bloque+A+B+C+A*C+A2+B2+C2,data=co2)
summary(modelo5) # Ecuación 6
```

Ahora se hace el mismo análisis con la librería *rsm*:

```{r}
experimento0 <-cube(~ A + B + C,n0 = 4,  
                    coding = c(A ~ (concentracion - (4.04+1.35)/2)/((4.04-1.35)/2),
                               B ~ (presion - (1861.58+1241.05)/2)/((1861.58-1241.05)/2),
                               C ~ (temperatura - (35+25)/2)/((35-25)/2)),
                    randomize=FALSE)

experimento1 = star(experimento0,  n0 = 0, alpha = 1.68, randomize = FALSE)
experimento <- djoin(experimento0, experimento1)
experimento$cambio <- co$cambio

# Sin incluir puntos axiales
modelo6 = rsm(cambio ~ FO(A,B,C)+TWI(A,C), data=experimento,  subset = (Block == 1))
summary(modelo6)

modelo7 = rsm(cambio ~ Block+FO(A,B,C) + TWI(A,C) + PQ(A,B,C), data=experimento)
summary(modelo7)


#Gráficos
persp(modelo7, C ~ A,
      bounds=list(A=c(-1,1), C=c(-1,1)),at=list(B = -1),
      zlim=c(8,16.9),zlab = "Cambio",contours = ~ A + C)

contour(modelo7, ~ A + C, image = TRUE,
        bounds=list(A=c(-1,1), C=c(-1,1)),
        at=list(B = -1))

persp(modelo7, B ~ C,
      bounds=list(B=c(-1,1), C=c(-1,1)),at=list(A = 1),
      zlim=c(11,16.9),zlab = "Cambio",contours = ~ B + C)

contour(modelo7, ~ B + C, image = TRUE,
       bounds=list(B=c(-1,1), C=c(-1,1)),at=list(A = 1))

persp(modelo7, B ~ A,
      bounds=list(A=c(-1,1), B=c(-1,1)),at=list(C = 1),
      zlim=c(7,16.9),zlab = "Cambio",contours = ~ B + A)

contour(modelo7, ~  B+A, image = TRUE,
      bounds=list(A=c(-1,1), B=c(-1,1)),at=list(C = 1))
```


## Ejemplo -- (Carlson y Carlson, 2005)

> A standard method for enamines synthesis from carbonyl compounds is to heat the parent aldehyde or ketone and a secondary amine in benzene or toluene and to remove the eliminated water by azeotropic distillation. However, this method fails with methyl ketone substrates which are prone to self-condensation under these conditions. These difficulties could be overcome by a procedure using anhydrous titanium tetrachloride as water scavenger. In the original procedure, titanium tetrachloride was added drop-wise to cold solution of the ketone and the amine, followed by prolonged stirring at room temperature. It was later found that the reaction time could be considerably shortened by a modified procedure, in which the carbonyl compound is added to a pre-formed complex between the amine and titanium tetrachloride.
For the modified procedure, it was found that the relative amounts of TiCl$\_4$/ketone and amine/ketone which should be used to achieve a rapid convertion were highly dependent on the structure of the ketone. In the example below, the formation of morphline enamine from methyl isobutyl ketone was studied. The design and the yields of enamine obtained after 15 minutes are given in the following table.

| Experiment # | TiCl$\_4$| Morpholine | Yield(%)|
|-----:|-----:|-----:|-----:|
| 1 | -1 | -1 | 73.4|
| 2 |  1 | -1 | 69.7|
| 3 | -1 |  1 | 88.7|
| 4 |  1 |  1 | 98.7|
| 5 | -1.414 | 0 | 76.8|
| 6 | 1.414 | 0 | 84.9|
| 7 |  0 | -1.414 | 56.6|
| 8 |  0 |  1.414 | 81.3|
| 9 |  0 | 0 | 96.8|
| 10|  0 | 0 | 96.4|
| 11|  0 | 0 | 87.5|
| 12|  0 | 0 | 96.1|
| 13|  0 | 0 | 90.5|



# Análisis de máxima pendiente

## Ejemplo -- Maximizing the yield of a process
*(Montgomery, 2013; p. 481, 489).*

A chemical engineer is interested in determining the operating conditions that maximize the yield of a process. Two controllable variables influence process yield: reaction time and reaction temperature. The engineer is currently operating the process with a reaction time of 35 minutes and a temperature of 155°F, which result in yields of around 40 percent. Because it is unlikely that this region contains the optimum, she fits a first-order model and applies the method of steepest ascent.

The engineer decides that the region of exploration for fitting the first-order model should be (30, 40) minutes of reaction time and (150, 160) Fahrenheit.

```{r}
exp0 <-cube(~ A + B,n0 = 5,  
                    coding = c(B ~ (temperatura - (160+150)/2)/((160-150)/2),
                               A ~ (tiempo - (40+30)/2)/((40-30)/2)),
                    randomize=FALSE)
exp0$res <- c(39.3,40.9,40.0,41.5,40.3,40.5,40.7,40.2,40.6)
```


**Modelo con interacción**
```{r}
mod0 = rsm(res ~ FO(A,B)+TWI(A,B), data=exp0)
summary(mod0)
contour(mod0, ~ B + A, image = TRUE,
        bounds=list(A=c(-1,1), B=c(-1,1)))
persp(mod0, B ~ A, bounds=list(A=c(-1,1), B=c(-1,1)),
      zlim=c(39,42),zlab = "Producción",contours = ~ A + B)
```

**Modelo sin interacción**
```{r}
mod1 = rsm(res ~ FO(A,B), data=exp0)
summary(mod1)
```
Note que el modelo ajustado es
$$\hat{y} = 40.44+0.775x\_1 +0.325x\_2,$$
luego al moverse en el camino de mayor ascenso, se incrementan 0.775 unidades en la dirección de $x\_1$ por cada 0.325 unidades en la dirección de $x\_2$. Por lo tanto, el camino de mayor ascenso pasa por (0,0) y tiene una pendiente de 0.325/0.775 = 0.419, es decir, la dirección de mayor ascenso es (1,0.419). El resumen del modelo ajustado `summary(mod1)` provee esta información normalizando el vector: (0.922, 0.387).  Montgomery (2013) toma 5 minutos como el paso básico en el tiempo. Así se inicia en el centro (35, 155) y los siguiente dos pasos en la dirección del mayor ascenso  son (40,157.095) y (45,159.195). En `R`se puede usar la función `steepest`.

```{r}
# Saltos de 5 minutos en el tiempo
steepest(mod1, dist = seq(0, 12, by = 1/.9221944))

# Saltos de tamaño 0.5 en las variables codificadas
steepest(mod1, dist = seq(0, 7, by = 0.5))
```

Esta función muestra el valor de la respuesta predicho, pero lo que realmente interesa son los puntos donde se debe realizar los nuevos experimentos. Tan pronto haya un descenso, la región alrededor de este punto debe examinarse. Asuma que se observaron las siguientes respuestas para cada uno de los pasos

```{r}
plot(1:12, c(41,42.9,47.1,49.7,53.8,59.9,65,70.4,77.6,80.3,76.2,75.1),
     xlab="Pasos", ylab="Respuesta", type="b", pch=16)
```
Luego un nuevo modelo de primer orden se ajusta alrededor del punto (85, 175).


```{r}
exp2 <-cube(~ A + B,n0 = 5,  
                    coding = c(A ~ (tiempo - (80+90)/2)/((90-80)/2),
                               B ~ (temperatura - (180+170)/2)/((180-170)/2)),
                    randomize=FALSE)
exp3 <- djoin(exp2,star(exp2,n0 = 0,alpha = 1.414,randomize=FALSE))

exp3$res <- c(76.5,78,77,79.5,79.9,80.3,80,79.7,79.8,75.6,78.4,78.5,77)

mod3 = rsm(res ~ FO(A,B), data=exp3,subset = (Block == 1))
summary(mod3)

mod4 = rsm(res ~ FO(A,B)+TWI(A,B), data=exp3,,subset = (Block == 1))
summary(mod4)

# Curvatura
tc <- (mean(exp3$res[1:4]) - mean(exp3$res[5:9]))/sqrt(var(exp3$res[5:9])*(1/4+1/5))

# Modelo cuadrático
# Todos los experimentos se hicieron al mismo tiempo
mod5 = rsm(res ~ SO(A,B), data=exp3)
summary(mod5)
```

Para caracterizar la superficie de respuesta alrededor de este punto, se transforma el modelo a un nuevo sistemas de coordenadas:

$$\hat{y} = \hat{y}\_s + \lambda\_1w\_1^2+\ldots + \lambda\_kw\_k^2,$$

donde las $\{w\}\_i$ son las variables transformadas y $\{\lambda\}\_i$ son los valores propios de la matriz $B\_Q$. Esta matriz tiene por diagonal los coeficientes cuadráticos del modelo. En la posición $ij$ tiene el coeficiente de la interacción entre la $i$-\ésima y la $j$-\ésima variable dividido en dos: $\beta_{ij}/2$.

Cuando el punto estacionario pertenece a la región de exploración, si los valores propios son todos mayores a cero, entonces se ha encontrado un mínimo. Si los  valores propios son todos menores a cero, entonces se ha encontrado un máximo. Si estos valores no tienen todos el mismo signo, se ha encontrado un punto de silla. Ahora bien,


```{r}
# Graficas
persp(mod5, B ~ A, bounds=list(A=c(-1,1), B=c(-1,1)),
      zlim=c(75,81),zlab = "Producción",contours = ~ B + A)
contour(mod5, ~ A + B, image = TRUE,bounds=list(A=c(-1,1), B=c(-1,1)))

#  producción máxima
predict(mod5,newdata = data.frame(A=0.3892304,B=0.3058466))
```

<!--Suponga que el proceso no se puede operar a una temperatura de 176.5$^{\circ}F$ y 87 minutos por alguna razón, como costos.

```{r}
# Camino canónico
canonical.path(mod5)
```
-->


### *Referencias*

Carlson, R., & Carlson, J. E. (2005). *Design and optimization in organic synthesis* (Vol. 24). Elsevier.

Montgomery, D. C. (2017). *Design and analysis of experiments*. John wiley & sons.
