#============================================================================
# Herramientas para el análisis estadístico de datos biológicos en R
# Capítulo 4. Inferencia
# Autores: Adriana López, Mónica Rojas Peña y Alex Rojas
#============================================================================

library(knitr)
library(kableExtra)
library(tidyverse)
library(ggplot2)
library(reshape2)

sexo = c("hembra", "macho")
set.seed(62521)
hipo = data.frame(sexo = sample(sexo, 1400, replace = TRUE),
                  reprod = 0)
n.hembra = round(table(hipo$sexo)["hembra"]*.8)
hipo.h = hipo %>% filter(sexo == "hembra")
hipo.h$reprod[1:n.hembra] = 1
hipo.h = dplyr::select(hipo.h, -sexo)


set.seed(1231)
muestra20 = rep_sample_n(hipo.h, size = 20)
cat("Proporción estimada:", mean(muestra20$reprod), "\n")


B = 1000
set.seed(61683)
m20 = hipo.h %>%
  rep_sample_n(size = 20, reps = B)


p20 = m20 %>%
  group_by(replicate) %>%
  dplyr::summarize(propMuestra = mean(reprod))


p20.est = p20 %>%
  group_by(propMuestra) %>%
  dplyr::summarize(prop = n()/B) %>%
  mutate(Tam = "20")

#### Figura 4.1
ggplot(p20.est, aes(x = propMuestra, y = prop)) +
  geom_segment(aes(x = propMuestra, xend = propMuestra,
                   y = 0, yend = prop), color = "lightgray") +
  geom_point(size = 2) +
  labs(x = "Proporción muestral", y = "Densidad") +
  theme_pubr(base_size = 14)


set.seed(68626)
p30.est = hipo.h %>%
  rep_sample_n(size = 30, reps = B) %>%
  group_by(replicate) %>%
  dplyr::summarize(propMuestra = mean(reprod)) %>%
  group_by(propMuestra) %>%
  dplyr::summarize(prop = n()/B) %>%
  mutate(Tam = "30")

set.seed(19233)
p50.est = hipo.h %>%
  rep_sample_n(size = 50, reps = B) %>%
  group_by(replicate) %>%
  dplyr::summarize(propMuestra = mean(reprod)) %>%
  group_by(propMuestra) %>%
  dplyr::summarize(prop = n()/B) %>%
  mutate(Tam = "50")

p.est = rbind(p20.est, p30.est, p50.est)

#### Figura 4.2
ggplot(p.est, aes(x = propMuestra, y = prop, color = Tam)) +
  geom_segment(aes(x = propMuestra, xend = propMuestra,
                   y = 0, yend = prop), color = "lightgray") +
  geom_point() +
  scale_color_manual(values =
                       c("#888888","#333333","#111111")) +
  facet_wrap(~Tam, ncol = 3) +
  labs(x = "Proporción muestral", y = "Densidad",
       color = "n") +
  theme_pubr()

#### Tabla 4.1
p.est %>% group_by(Tam) %>%
  summarize(m = sum(propMuestra*prop),
            v = sum((propMuestra-m)^2*prop),
            s = sqrt(v)) %>%
  kable('pipe',
        col.names = c("n","Media", "Varianza", "Error estándar"))


#===================
# Sección 4.1
#===================


k.obs = sum(muestra20$reprod)
L.theta = function(theta, k = k.obs, n = 20)
  return(theta^k*(1-theta)^(n-k))
thetas = data.frame(theta = seq(0.4, 0.99, length = 101))
ggplot(thetas, aes(x = theta)) +
  geom_function(fun = L.theta,
                args = list(k = k.obs, n = 20)) +
  labs(x = TeX("$\\theta$"), y = TeX("$L(\\theta)$")) +
  geom_vline(xintercept = mean(muestra20$reprod),
             linetype = "dashed") +
  theme_pubr()

##### Ejemplo 4.1
parasitos = read_delim("Datos/Parasite.txt", delim = "\t") %>%
  mutate(site = factor(site,
                       levels = c("ind", "kyrg", "sib"),
                       labels = c("India", "Kirguistán",
                                  "Rusia")))

parasitos.prop = parasitos %>% group_by(site, species) %>%
  dplyr::summarize(prop = mean(infected))

#### Tabla 4.2
dcast(parasitos.prop, site ~ species) %>% kable('pipe')


##### Ejemplo 4.2
Respiros.gariepinus = gariepinusIG %>%
  drop_na(breaths) %>%
  filter(socialtrt == 'Solo' & O2sat == 100) %>%
  dplyr::select(breaths)

#### Figura 4.4
L.poisson  = function(lambda, x = Respiros.gariepinus$breaths)
  return(sum(dpois(x, lambda, log = TRUE)))

lambdas = data.frame(l = seq(0.1, 1.5, length=101)) %>%
  mutate(vero = sapply(l, L.poisson))

ggplot(lambdas, aes(l, vero)) +
  geom_line() +
  labs(x = TeX("$\\lambda$"), y = TeX("$l(\\lambda)$")) +
  geom_vline(xintercept = mean(Respiros.gariepinus$breaths),
             linetype = "dashed") +
  theme_pubr()

library(maxLik)
gari.Est.vero = maxLik(L.poisson, start = 0.1)


#### Ejemplo 4.3
Num.regulados = data.frame(numero = 0:5,
                           Observados = c(72, 18, 10, 5, 1,3))

#### Figura 4.5

L.geom  = function(p, x = Num.regulados){
  y = rep(x$numero, x$Observados)
  return(sum(dgeom(y, p, log = TRUE)))
}

p_gr = data.frame(p = seq(0.1, 0.9, length=101)) %>%
  mutate(vero = sapply(p, L.geom))

ggplot(p_gr, aes(p,vero)) +
  geom_line() +
  labs(x = TeX("$p_{gr}$"), y = TeX("$l(p_{gr})$")) +
  geom_vline(xintercept = 109/(109+72),
             linetype = "dashed") +
  theme_pubr()


geom.mv = maxLik(L.geom, start = 0.5)
geom.mv$estimate


#===================
# Sección 4.2
#===================

m1 = rep_sample_n(muestra20, size = 20, replace = TRUE)

m1.p = mean(m1$reprod)

#### Figura 4.6

B = 10000
p20.boot.est = muestra20 %>%
  rep_sample_n(size = 20, reps = B, replace = T) %>%
  group_by(replicate) %>%
  summarize(propMuestra = mean(reprod)) %>%
  group_by(propMuestra) %>%
  summarize(prop = n()/B)

ggplot(p20.boot.est, aes(x = propMuestra, y = prop)) +
  geom_segment(aes(x = propMuestra, xend = propMuestra,
                   y = 0, yend = prop), color = "lightgray") +
  geom_point() +
  labs(x = "Proporción muestral", y = "Densidad") +
  theme_pubr()


#===================
# Sección 4.2.1
#===================

limIC20 = m20 %>%
  group_by(replicate) %>%
  summarize(propMuestra = mean(reprod)) %>%
  mutate(se = sqrt(propMuestra*(1-propMuestra)/20),
         l.inf = propMuestra + qnorm(.025)*se,
         l.sup = propMuestra + qnorm(.975)*se,
         Pertenece = (l.sup>.8)*(l.inf<.8))

#### Figura 4.7
limIC20 %>%
  dplyr::slice(1:100) %>%
  mutate(pert = factor(Pertenece, c("0", "1"),
                       c("Afuera", "Adentro"))) %>%
  ggplot(aes(x = propMuestra, y = replicate, color = pert)) +
  geom_point(alpha = 0.3) +
  geom_segment(aes(y = replicate, yend = replicate,
                   x = l.inf, xend = l.sup, color = pert)) +
  geom_vline(xintercept = 0.8, linetype = "dotted") +
  scale_color_manual(values = c("gray10", "gray90")) +
  theme_pubclean(base_size = 14) +
  labs(x = "Proporción muestral", y = "Muestra", color = "")

#### Ejemplo 4.4

BinomCI(15, 54, method = c("wilson", "agresti-coull"))

#===================
# Sección 4.2.2
#===================

p20.boot.IntSE = p20.boot.est %>%
  summarize(m0 = mean(muestra20$reprod),
            m  = sum(propMuestra*prop),
            se = sqrt(sum((m - propMuestra)^2*prop)),
            L.inf = m0 - qnorm(0.975)*se,
            L.sup = m0 + qnorm(0.975)*se)

p20.boot = muestra20 %>%
  specify(response = reprod) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "mean")

p20.boot.IntPer = p20.boot %>%
  get_confidence_interval(point_estimate = mean(muestra20$reprod),
                          type="se", level = 0.95)

p20.boot.IntPerc = p20.boot %>%
  get_confidence_interval(type = "percentile", level = 0.95)

#### Ejemplo 4.5
paloma = data.frame(ataque = rep(c("e", "f"), c(15, 39)))

paloma.boot = paloma %>%
  specify(response = ataque, success = "e") %>%
  generate(reps = 10000, type ="bootstrap")  %>%
  calculate(stat = "prop")

paloma.boot.IntPer = paloma.boot %>%
  get_confidence_interval(point_estimate = 15/54,
                          type="percentile", level = 0.95)

#### Ejemplo 4.6
lobos = read_delim('Datos/Lobos.txt', delim = "\t") %>%
  drop_na(age)

lobos.boot = lobos %>%
  specify(response = age) %>%
  generate(reps = 10000, type ="bootstrap")  %>%
  calculate(stat = "mean")

lobos.boot.IntPer = lobos.boot %>%
  get_confidence_interval(point_estimate = mean(lobos$age),
                          type="percentile", level = 0.95)

#### Ejemplo 4.7

TipoVar = cols(sample = "i",
               management = col_factor(c("AG", "FS")),
               fungal.frequency = col_factor(c("0", "1")),
               fungi = col_factor())
HonA2 = read_delim('Datos/FungalFrequencyArea2.txt',
                   delim = "\t", col_types = TipoVar) %>%
  dplyr::rename(muestra = sample, man = management,
                p = fungal.frequency, hongo = fungi)

HonA2.boot = HonA2 %>%
  specify(p ~ man, success = "1") %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "diff in props",  order = c("AG", "FS") )

hongo.IC = get_confidence_interval(HonA2.boot, level = 0.95)


#### Figura 4.8
visualize(HonA2.boot) +
  shade_confidence_interval(hongo.IC, color = "gray50",
                            fill = "gray90",
                            linetype = "dotted") +
  labs(x = TeX('$\\widehat{p}_{a} - \\widehat{p}_{s} $'),
       y = 'Frecuencia',title = "") +
  theme_pubr()


prop.test(x = c(63, 40), n = c(78, 75))

#### Ejemplo 4.8
arana = read_excel('Datos/Mutilacion.xlsx', na = "NA" )  %>%
  dplyr::select(nb_insertions,mutilation) %>%
  mutate(mutilacion = (mutilation == "mutilated") + 0) %>%
  drop_na()

arana.boot = arana %>%
  specify(nb_insertions ~ mutilacion) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "correlation", method = "spearman")

arana.RhoEst = cor(arana$nb_insertions, arana$mutilacion,
                   method = "spearman")

arana.boot.IntRho = arana.boot %>%
  get_confidence_interval(point_estimate = arana.RhoEst,
                          level = 0.95)


#### Ejemplo 4.9
maiz = c(2.15, 2.14, 2.13, 2.13, 2.12, 2.11, 2.10, 2.08, 2.08,
         2.08, 2.04, 2.05, 2.03, 2.02, 2.01, 2.00, 1.99, 1.96,
         1.95, 1.93, 1.89)
algodon = c(2.12, 2.07, 2.01, 1.93, 1.77, 1.68, 1.64, 1.61, 1.59,
            1.58, 1.56, 1.55, 1.54, 1.49, 1.45, 1.43, 1.39, 1.34,
            1.33, 1.29, 1.26, 1.24, 1.11, 1.05)
mosca.Tel = data.frame(trat = rep(c("maiz", "algodon"),
                                  c(length(maiz), length(algodon))),
                       distancia = c(maiz, algodon))

mosca.Tel.boot = mosca.Tel %>%
  specify(distancia ~ trat) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "diff in means", order = c("maiz", "algodon"))

mosca.Tel.IC = get_confidence_interval(mosca.Tel.boot)

t.test(distancia ~ trat, data = mosca.Tel)

#===================
# Sección 4.3
#===================

#### Ejemplo 4.10
set.seed(872356)
mosca.p1 = mosca.Tel %>%
  mutate( p1 = sample(distancia)) %>%
  group_by(trat) %>% summarize(promP1 = mean(p1))

mosca.Tel.per = mosca.Tel %>%
  specify(distancia ~ trat) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 1000, type = "permute")  %>%
  calculate(stat = "diff in means", order = c("maiz", "algodon"))

#### Figura 4.9
visualize(mosca.Tel.per) +
  shade_p_value(obs_stat = 0.51, direction = "both",
                color = "gray50", fill = "gray90",
                linetype = "dotted") +
  labs(x = TeX('$\\bar{x}_{maíz} - \\bar{x}_{algodón} $'),
       y = 'Frecuencia', title = "") +
  theme_pubr(base_size = 14)

#### Ejemplo 4.11
craneo.per =  read_csv('Datos/CraneoPCA.csv') %>%
  specify(Dim.1 ~ Condicion) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 10000, type = "permute")  %>%
  calculate(stat = "diff in means",
            order = c("Craniosynostosis", "Normal"))

craneo.pvalor = get_p_value(craneo.per,obs_stat = 70.96477,
                            direction = "both")

#### Ejemplo 4.12
Fundulus.Orig = data.frame(
  Depredado = rep(c("si", "no"), c(48, 93)),
  Infectado = rep(rep(c("sin", "ligeramente", "altamente"), 2),
                  c(1, 10, 37, 49, 35, 9)))

Fundulus.Orig %>%
  group_by(Depredado,Infectado) %>%
  summarize(frec = n())  %>%
  dcast(Infectado~Depredado, value.var = "frec")

Fundulus.chi2 = Fundulus.Orig %>%
  specify(Depredado ~ Infectado) %>%
  calculate(stat = "Chisq")

Fundulus.Perm = Fundulus.Orig %>%
  specify(Depredado ~ Infectado) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 1000, type = "permute") %>%
  calculate(stat = "Chisq")

#### Figura 4.10
ggplot(Fundulus.Perm, aes(stat)) +
  geom_histogram(aes(y = ..density..), binwidth = 1,
                 boundary = 0, color = "white") +
  stat_function(fun = dchisq, args = list(df = 2)) +
  labs(x = TeX('$\\chi^2$'), y = "Densidad") +
  theme_gray(base_size = 14)

chisq_test(Fundulus.Orig, Depredado ~ Infectado)

#### Ejemplo 4.13
brca2.chi2 = brca2 %>% specify(response = Sec) %>%
  hypothesize(null = "point",
              p = c("a" = 0.25, "c" = 0.25, "g" = 0.25,
                    "t" = 0.25)) %>%
  calculate(stat = "Chisq")

brca2.sim = brca2 %>% specify(response = Sec) %>%
  hypothesize(null = "point",
              p = c("a" = 0.25, "c" = 0.25, "g" = 0.25,
                    "t" = 0.25)) %>%
  generate(reps = 1000, type = "draw") %>%
  calculate(stat = "Chisq")


#### Figura 4.11
ggplot(brca2.sim, aes(stat)) +
  geom_histogram(aes(y = ..density..), binwidth = 1,
                 boundary = 0, color = "white") +
  stat_function(fun = dchisq, args = list(df = 3)) +
  labs(x = TeX('$\\chi^2$'), y = "Densidad") +
  theme_gray(base_size = 14)


#### Ejemplo 4.14
Num.regulados = Num.regulados %>%
  mutate(Esperados = 109*dgeom(numero, 109/(109+72)))
Num.regulados$Esperados[6] = 109-sum(Num.regulados$Esperados[-6])

Num.regulados %>%
  melt(id.vars = "numero", value.name = "Prob",
       measure.vars =c("Esperados", "Observados"))  %>%
  ggplot(aes(x = numero, y = Prob, shape = variable)) +
  geom_point(size = 4) +
  scale_shape_manual(values = c(1,2))+
  labs(x = "Número de genes regulados",
       y = "Conteos", shape = "")+
  theme_pubr(base_size = 14)

GenReg = data.frame(num = rep(as.character(0:5),
                              Num.regulados$Observados))

genReg.p = dgeom(0:5, 109/183)
genReg.p[6] = 1 - sum(genReg.p[1:5])
names(genReg.p) = as.character(0:5)

GenesReg.sim = GenReg %>%
  specify(response = num) %>%
  hypothesize(null = "point", p = genReg.p) %>%
  generate(reps = 1000, type = "draw") %>%
  calculate(stat = "Chisq")

#### Figura 4.13
visualize(GenesReg.sim) +
  shade_p_value(obs_stat = 6.960, direction = "right",
                color = "gray50", fill = "gray90",
                linetype = "dotted") +
  labs(x = TeX('$\\chi^2$'), y = "Frecuencia", title = "") +
  theme_pubr(base_size = 14)


#### Ejemplo 4.15

l.logit = function(param, datos = ICHs){
  p = exp(param[1] + param[2]*datos$nivel)
  p = p/(1+p)
  return(sum(dbinom(datos$vivos, datos$total, p, log = TRUE)))
}

v = c(11, 0, 9, 1, 15, 3, 12, 2, 6, 1, 4, 5, 4, 9, 1, 8)
ICH = data.frame(nivel = rep(c(10, 30, 50, 70, 90, 125, 175, 225),
                             c(11, 10, 18, 14, 7, 9, 13, 9)),
                 vivo = rep(rep(c(1,0), 8), v))

ICHs = ICH %>% group_by(nivel) %>%
  dplyr::summarize(vivos = sum(vivo), total = n())

logit.mv = maxLik(l.logit, start = c(0, 0))


p.estimada = function(x, a = logit.mv$estimate[1],
                      b = logit.mv$estimate[2]){
  logit.p = a + b*x
  return(exp(logit.p)/(1+exp(logit.p)))
}

#### Figura 4.15
ICHs %>% mutate(frec = vivos/total) %>%
  ggplot(aes(x = nivel, y = frec)) +
  geom_point() +
  geom_function(fun = p.estimada) +
  labs(x = TeX('Nivel de infección en un área de $0.16\\, m^2$'),
       y = "Probabilidad de supervivencia") +
  theme_pubr(base_size = 14)


l1 = function(datos, indices){
  datos = datos[indices,]
  ICHs = datos %>%
    group_by(nivel) %>%
    dplyr::summarize(vivos = sum(vivo), total = n())
  ab.mv = maxLik(l.logit, start = c(0, 0), datos = ICHs)
  return(ab.mv$estimate)
}

library(boot)
l2 = boot(data = ICH, statistic = l1, R = 1000)
muestra.ab = data.frame(l2$t)

#### Figura 4.16
ggplot(muestra.ab, aes(X1, X2)) +
  geom_hex() +
  scale_fill_gradient(low = "#999999", high = "#000000") +
  geom_density_2d(color = "gray10") +
  labs(x = TeX('$\\alpha$'), y = TeX('$\\beta$'),
       fill= 'Conteos') +
  theme_gray(base_size = 14)

IC.alpha = quantile(muestra.ab$X1, prob = c(0.025, 0.975))
IC.beta = quantile(muestra.ab$X2, prob = c(0.025, 0.975))

logit.glm = glm(vivo ~ nivel, data = ICH, family = binomial)
