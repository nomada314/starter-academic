#============================================================================
# Herramientas para el análisis estadístico de datos biológicos en R
# Capítulo 3. Probabilidad
# Autores: Adriana López, Mónica Rojas Peña y Alex Rojas
#============================================================================

library(knitr)
library(kableExtra)
library(tidyverse)
library(ggplot2)
library(reshape2)

#===================
# Sección 3.1
#===================

### Ejemplo 3.1
cod.genetico = geneticCodeTable(DNA = F) %>%
  dplyr::rename(p = FirstPosition, s = SecondPosition,
                t = ThirdPosition, cod = GeneticCode,
                Amino = AminoAcids, simbolo = AA)

seleccionados = c("Stop", "M", "W")
cod.genetico %>% filter(simbolo  %in% seleccionados) %>%
  group_by(simbolo) %>% summarize(Frec = n()) %>%
  pivot_wider(names_from = simbolo, values_from = Frec)

### Ejemplo 3.5
cod.genetico %>% filter(p  == "A") %>%
  summarize(Prob = n()/64)

cod.genetico %>%
  mutate(num.U = (p  == "U")+(s  == "U")+(t  == "U"))  %>%
  filter(num.U == 1) %>%
  summarize(Prob = n()/64)

cod.genetico %>%
  mutate(num.C = (p  == "C") + (s  == "C") + (t  == "C"))  %>%
  filter(num.C == 2) %>%
  summarize(Prob = n()/64)

#===================
# Sección 3.3
#===================

#===================
# Sección 3.3.1.1.
#===================

#### Figura 3.1
x = 0:3
x.Px = data.frame(x=x, y=dbinom(x, 3, 0.6))
ggplot(x.Px, aes(x, y)) +
  geom_point(size = 2) +
  geom_segment(aes(x = x, xend = x, y = 0, yend = y),
               color = "lightgray") +
  labs(x = TeX('$x$'), y = TeX('$p(x)$')) +
  theme_bw(base_size = 14)


x = 0:3
px = dbinom(x,3, 0.6)
Ex = sum(x*px)
Vx = sum(px*(x -Ex)^2)


#===================
# Sección 3.3.1.2
#===================

#### Figura 3.2
ggplot(data.frame(x = 0:60, y = dgeom(0:60,3/64)), aes(x,y)) +
  geom_point() +
  geom_segment(aes(x = x, xend = x, y = 0, yend = y),
               color = "lightgray") +
  labs(y = TeX('$p(k)$'), x = TeX('$k$')) +
  theme_bw(base_size = 14)

#### Figura 3.3
data.frame(k = 0:60,
           y = pgeom(0:60, 3/64, lower.tail = FALSE)) %>%
  ggplot(aes(k, y)) +
  geom_step() +
  labs(y = TeX('$p(X > k)$'), x = TeX('$k$')) +
  geom_hline(aes(yintercept = 0.1), linetype="dashed") +
  theme_bw(base_size = 16)
# Encontrar valor de l:
l = which(pgeom(1:60, 3/64, lower.tail = FALSE) < .1)[1]


#===================
# Sección 3.3.1.3
#===================

##### Ejemplo 3.22
brca2 = read.fasta("Datos/BRCA2.fa")[[1]]
brca2 = data.frame(Sec = getSequence(brca2)) %>%
  dplyr::filter(!Sec == 'n')

tabFrecBRCA2 = brca2 %>%
  group_by(Sec) %>%
  dplyr::summarize(o = n()) %>%
  mutate(Observadas = o/sum(o), Modelo = 1/4) %>%
  melt(id.vars='Sec',
       measure.vars = c("Observadas", "Modelo"),
       variable.name = "EspObs", value.name = "Probabilidad")

##### Figura 3.4
ggplot(tabFrecBRCA2, aes(x = Sec, y = Probabilidad,
                         color = EspObs, shape = EspObs)) +
  geom_point(size = 2) +
  scale_color_manual(values = c("black", "gray10")) +
  scale_shape_manual(values = c(16, 1)) +
  theme_bw(base_size = 14) + ylim(0, .32) +
  labs(x = "Nucleótidos", shape=" ", color=" ")


#===================
# Sección 3.3.1.4
#===================

n = 1000
set.seed(3141516)
arbustos = data.frame(x = runif(n), y = runif(n))
puntosMalla = seq(0, 1, .05)
malla = data.frame(x0 = puntosMalla,
                   y0 = puntosMalla,
                   xend = puntosMalla,
                   yend = puntosMalla)

ggplot(arbustos, aes(x,y)) +
  geom_point(alpha = 0.1) +
  scale_y_continuous(breaks = seq(0,1, 0.2), expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(0,1, 0.2), expand = c(0, 0)) +
  theme_bw() +
  theme(axis.line = element_blank(),
        text = element_blank(),
        title = element_blank(),
        axis.ticks = element_blank())

arbustos = arbustos %>%
  mutate( c.x = floor(x*10),
          c.y = floor(y*10),
          c.xy = c.y*10 + c.x + 1)

conteos = arbustos %>%
  group_by(c.xy) %>%
  summarize(x.obs = n()) %>%
  mutate(x0 = rep(1:10, 10)/10 -.05,
         y0 = rep(1:10, each = 10)/10 -.05)

#### Figura 3.6
ggplot(arbustos, aes(x,y)) +
  geom_point(alpha = 0.1) +
  geom_text(conteos,
            mapping = aes(x0, y0,
                          label = as.character(x.obs)),
            size = 5) +
  scale_y_continuous(breaks = seq(0,1, 0.2), expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(0,1, 0.2), expand = c(0, 0)) +
  theme_bw() +
  theme(axis.line = element_blank(),
        text = element_blank(),
        title = element_blank(),
        axis.ticks = element_blank())

obs = conteos %>%
  group_by(x.obs) %>%
  summarize(f.obs = n()) %>%
  mutate(f.esp = dpois(x.obs,mean(conteos$x.obs)))


#### Figura 3.7
ggplot(obs, aes(x=x.obs, y = f.obs/100)) +
  geom_point(size = 3, alpha = 0.6) +
  geom_point(aes(y = f.esp), shape = 16) +
  geom_segment(aes(x = x.obs, xend = x.obs,
                   y = 0, yend = f.esp),
               color = "lightgray") +
  labs(x = "Conteo", y = "Probabilidad") +
  theme_bw(base_size = 14)


#===================
# Sección 3.3.2.
#===================

#===================
# Sección 3.3.2.1
#===================

n = 100000
arbustos = rbinom(n, 1, 0.02)
presencia = which(arbustos > 0)

distancias = data.frame(x = diff(presencia))

#### Figura 3.8
ggplot(distancias, aes(x)) +
  geom_histogram(aes(y = ..density..), fill = "gray",
                 bins = 50, boundary = 0) +
  geom_function(fun = dexp, args = list(rate = 0.02)) +
  labs(x = "Distancia", y = "Densidad") +
  theme_bw(base_size = 14)

#===================
# Sección 3.3.2.2
#===================


muestras = matrix(rpois(1000*49, 7), ncol = 49)
medias = data.frame(m = apply(muestras, 1, mean))

#### Figura 3.9
ggplot(medias, aes(x = m)) +
  geom_histogram(aes(y = ..density..), fill = "gray",
                 bins=30, boundary=0) +
  geom_function(fun = dnorm,
                args = list(mean = 7, sd = sqrt(7/49))) +
  labs(x = "Medias muestrales", y = "Densidad") +
  theme_bw(base_size = 14)

#### Figura 3.10
ggplot() + xlim(-5, 5.5) +
  geom_function(aes(color = "norm(0,1)"), fun = dnorm) +
  geom_function(aes(color = "norm(0,0.64)"), linetype="dotted",
                fun = dnorm, args = list(mean = -2, sd = .8)) +
  geom_function(aes(color = "norm(0,1.44)"), linetype="dashed",
                fun = dnorm, args = list(mean = 2, sd = 1.2)) +
  scale_colour_manual(values = c("gray40","gray70","black")) +
  labs(y = "Densidad", color = "", x = "x") +
  theme_minimal(base_size = 14)


#===================
# Sección 3.3.2.3
#===================

n = 9
muestras = matrix(rnorm(1000*n, 10, 2), ncol = n)
varianzas = data.frame(v = (n-1)*apply(muestras, 1, var)/4)

#### Figura 3.11
ggplot(varianzas, aes(x = v)) +
  geom_histogram(aes(y = ..density..), fill = "gray",
                 bins=30, boundary=0) +
  geom_function(fun = dchisq,
                args = list(df = n-1)) +
  labs(x = "Varianzas muestrales", y = "Densidad") +
  theme_bw(base_size = 14)

