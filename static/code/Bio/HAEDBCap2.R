#============================================================================
# Herramientas para el análisis estadístico de datos biológicos en R
# Capítulo 1. Análisis Exploratorio de Datos
# Autores: Adriana López, Mónica Rojas Peña y Alex Rojas
#============================================================================

library(knitr)
library(kableExtra)
library(tidyverse)
library(ggplot2)

#===================
# Sección 2.1
#===================

#===================
# Sección 2.1.1
#===================

### Ejemplo 2.1

library(seqinr)
levadura = read.fasta("Datos/NONCODEv5_yeast.fa")
levadura1.df =  data.frame(Sec1 = getSequence(levadura[[1]]))

ggplot(levadura1.df, aes(x = Sec1)) +
  geom_bar() +
  labs(x = 'Base nitrogenada', y = 'Frecuencia') +
  theme_gray(base_size = 14)

levadura1.frec = levadura1.df %>%
  group_by(Sec1) %>%
  summarize(frec = n()) %>%
  arrange(desc(frec))

etiquetas = levadura1.frec$Sec1

levadura1.df$Sec1 = factor(levadura1.df$Sec1, levels = etiquetas)

ggplot(levadura1.df, aes(x = Sec1)) +
  geom_bar() +
  labs(x = 'Base nitrogenada', y = 'Frecuencia') +
  theme_gray(base_size = 14)

ggplot(levadura1.df, aes(x = Sec1)) +
  geom_bar(aes(y = ..prop.., group = 1)) +
  labs(x = 'Base nitrogenada', y = 'Proporción') +
  theme_gray(base_size = 14)

levadura1.df %>%
  group_by(Sec1) %>%
  summarize(frec = n()) %>%
  arrange(desc(frec)) %>%
  mutate(prop = frec/sum(frec),
         Sec1 = factor(Sec1, levels = Sec1)) %>%
  ggplot(aes(x = Sec1, y = prop)) +
  geom_bar(stat = "identity") +
  theme_grey(base_size = 14) +
  labs(x = "Base nitrogenada", y = "Frecuencia")

### Ejemplo 2.2

etiquetas = c("<4", "4-7", "8-11", "12-15", "16-18")
ACI = data.frame(edad = factor(etiquetas, levels = etiquetas),
                 Frec = c(102, 64, 43, 68, 43))
ggplot(ACI, aes(x = edad, y = Frec)) +
  geom_bar(stat = "identity") +
  labs(x = "Edad de inicio del accidente", y = "Frecuencia") +
  theme_grey(base_size = 14)


library(ggsci)
ACI = ACI %>% mutate(prop = Frec/sum(Frec))
ggplot(ACI, aes(x = edad, y = prop)) +
  geom_bar(aes(fill = prop), stat = "identity") +
  scale_fill_material("blue-grey") +
  labs(x = "Edad de inicio de ACI", y = "Proporción",
       fill = "Proporción") +
  theme_bw(base_size = 14)

### Ejemplo 2.3

ggplot(Herradura, aes(x = satelites)) +
  geom_bar() +
  labs(x = "Numero de satelites", y = "Frecuencia") +
  theme_bw(base_size = 14)


### Ejemplo 2.4

ggplot(Peck.Mouth, aes(x = `Mouth W.`)) +
  geom_histogram(binwidth =1.2, color = "black", fill = "gray") +
  labs(x = 'Ancho de la boca (mm)', y = 'Frecuencia') +
  scale_x_continuous(breaks = seq(5,30,5)) +
  theme_classic(base_size = 14)

### Ejemplo 2.5

forma = function(x, lambda, t)
  return(t*(1+x)^(1/(1+lambda))*(1-x)^(lambda/(1+lambda)))

h.Forma = function(a, e){
  xs = seq(-1, 1, length = 501)
  ys = forma(xs, a, e)
  a = data.frame(x = c(xs, rev(xs)), y =  c(ys, -rev(ys)))
  p = ggplot(a, aes(y, x)) + geom_polygon(fill = '#CECEBB') +
    theme(panel.background = element_blank(),
          axis.line = element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank()) +
    xlim(-1, 1)
  return(p)
}

library(ggpubr)
ggarrange(h.Forma(1.4850, 1/(1+.503)),
          h.Forma(1.0221, 1/(1+.707)),
          h.Forma(1.0226, 1/(1+.0967)),
          labels = c("A", "B", "C"), ncol = 3)


huevos = read_excel("Datos/huevos.xlsx")
huevos = huevos %>% drop_na()
ggplot(huevos, aes(x = Asymmetry)) +
  geom_histogram(bins = 30, alpha = 0.6) +
  labs(x = 'Asimetría', y = 'Frecuencia') +
  theme_gray(base_size = 14)


#===================
# Sección 2.1.2
#===================

### Ejemplo 2.6

etiquetas = c('Sin', 'Ligera', 'Alta')
Fundulus = data.frame(Infeccion = gl(3, 2, labels = etiquetas),
                      Depredacion = gl(2, 1, 6, c('Sí', 'No')),
                      Frec = c(1, 49, 10, 35, 37, 9))

Fundulus = Fundulus %>% group_by(Infeccion) %>%
  mutate(porc = 100*Frec/sum(Frec))

ggplot(Fundulus, aes(x= Infeccion, y= Frec, fill= Depredacion)) +
  geom_bar(stat = "identity", position = "dodge2") +
  labs(x = "Infección", y = "Porcentaje", fill = "Depredación") +
  scale_fill_grey(start = 0.6, end = 0.3) +
  theme_bw(base_size = 14)


ggplot(Fundulus, aes(x = Depredacion, y = porc,
                     fill = Depredacion))+
  geom_bar(stat = "identity") +
  labs(x = "Infección", y = "Porcentaje")+
  scale_fill_grey(start = 0.6, end = 0.3)+
  facet_wrap( ~ Infeccion, ncol = 3)+
  theme(legend.position = "top") +
  theme_bw(base_size = 14)


### Ejemplo 2.7

Depredador = read_csv("Datos/Camacho_MEC.csv")
Depredador = Depredador %>%
  mutate(ELEV2 = cut(ELEV, breaks = seq(0, 4000, 500),
                     labels = c(    "0-500",  "500-1000",
                                    "1000-1500", "1500-2000",
                                    "2000-2500", "2500-3000",
                                    "3000-3500", "3500-4000")))

PorcentajeDepredacion = Depredador %>%
  group_by(SITE) %>%
  mutate(Depred = sum(PRED) > 0) %>%
  filter(Depred) %>%
  group_by(SITE) %>%
  mutate(p = 100*PRED/sum(PRED))

PD = PorcentajeDepredacion %>%
  group_by(ELEV2, ID) %>%
  dplyr::summarize(porcRango = mean(p))

ggplot(PD, aes(x = ELEV2, y = porcRango,
               fill = factor(ID, levels = c("noant", "ant")))) +
  geom_bar(stat = "identity")  +
  geom_point(filter(PorcentajeDepredacion, ID == "ant"),
             mapping = aes(x = ELEV2, y = p, shape = SLOPE),
             size=3, position = position_jitter(w = 0.3, h = 0))+
  scale_fill_grey(start = 0.55, end = 0.3,
                  labels = c("Otro", "Hormiga")) +
  scale_shape_manual(values = c(17,16), guide = FALSE) +
  theme_classic(base_size = 14) +
  theme(legend.position = "top") +
  labs(fill="Depredador", y = "Porcentaje de depredación total",
       x="Rangos de elevación  (m.s.n.m)") +
  guides(fill= guide_legend(reverse = TRUE))


### Ejemplo 2.8


genes.MS = genes %>% group_by(gen) %>%
  summarize(m = mean(Valores), s = sd(Valores)) %>%
  arrange(desc(m))

ggplot(genes.MS, aes(x = gen, y = m)) +
  geom_bar(stat= "identity", fill = "gray",color = "black") +
  geom_errorbar(aes(ymin = m, ymax = m + s), width = .07) +
  scale_x_discrete(labels = nombreGenes) +
  theme_gray(base_size = 14) +
  labs(x = "Gen", y = "Expresión genética")

### Ejemplo 2.9

ggplot(genes,aes(x = gen, y = Valores)) +
  geom_boxplot() +
  geom_jitter(width = 0.15, alpha = 0.4) +
  scale_x_discrete(labels = nombreGenes) +
  labs(x = "Gen", y = "Expresión genética") +
  theme_bw(base_size = 14)


### Ejemplo 2.10

gariepinusIG %>%
  drop_na(breaths) %>%
  ggplot(aes(x = O2, y = breaths)) +
  geom_boxplot(aes(fill = O2), alpha = 0.5,
               show.legend = FALSE) +
  geom_jitter(aes(colour = Cambio), width = 0.01, alpha = 0.2) +
  geom_line(aes(group = Fgrupo, colour = Cambio)) +
  facet_wrap(~socialtrt, ncol = 2) +
  labs(x = "Disponibilidad de oxígeno (% saturación)",
       y = "Número de salidas a tomar aire") +
  scale_colour_manual(values=c("#666565", "#CFCECF", "#9D9C9D"))+
  scale_fill_grey(start = 0.8, end = 0.3) +
  theme_bw(base_size = 14)


## Diagrama de violín y de enjambre

ggplot(genes,aes(x = gen, y = Valores)) +
  geom_violin() +
  scale_x_discrete(labels = nombreGenes) +
  labs(x = "Gen", y = "Expresión genética") +
  theme_bw(base_size = 14)

library("ggbeeswarm")
ggplot(genes,aes(x = gen, y = Valores)) +
  geom_beeswarm(alpha = 0.4) +
  scale_x_discrete(labels = nombreGenes) +
  labs(x = "Gen", y = "Expresión genética") +
  theme_bw(base_size = 14)


### Ejemplo 2.11

ggplot(huevos, aes( Asymmetry, Ellipticity)) +
  geom_point(alpha = .4) +
  labs(x = 'Asimetría', y = 'Forma elíptica') +
  theme_minimal(base_size = 14)

library(ggExtra)
fig = ggplot(huevos, aes(Asymmetry, Ellipticity)) +
  geom_point(alpha = .4) +
  labs(x = 'Asimetría', y = 'Forma elíptica') +
  theme_minimal(base_size = 14)
ggMarginal(fig, type = "histogram")

ggplot(huevos, aes(x = Asymmetry, y = Ellipticity,
                   size = `AvgLength (cm)`)) +
  geom_point( alpha = 0.4) +
  labs(x = 'Asimetría', y = 'Forma elíptica',
       size = 'Longitud (cm)') +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom")


huevos %>% filter(Order=="STRIGIFORMES"|Order=="SULIFORMES") %>%
  ggplot(aes(x = Asymmetry, y = Ellipticity,
             size=`AvgLength (cm)`, color = Order)) +
  geom_point() +
  scale_color_manual(values = c("gray", "black"),
                     labels = c("Strigiformes", "Suliformes")) +
  labs(x = 'Asimetría', y = 'Forma elíptica',
       size='Longitud (cm)', color = "Orden") +
  theme_minimal(base_size = 14) +
  guides(size = guide_legend(override.aes = list(shape = 21)))



OrdenesAIncluir <- c('ANSERIFORMES','STRIGIFORMES','SULIFORMES',
                     'APODIFORMES','CHARADRIIFORMES',
                     'PASSERIFORMES')
huevos %>% filter(Order %in% OrdenesAIncluir) %>%
  mutate(Order = factor(Order, levels = OrdenesAIncluir)) %>%
  ggplot(aes(x = Asymmetry, y = Ellipticity,
             size = `AvgLength (cm)`)) +
  geom_point(alpha = .2) +
  labs(x = 'Asimetría', y = 'Forma elíptica',
       size = 'Longitud (cm)') +
  facet_wrap( ~ Order, ncol = 3) +
  theme(legend.position = "bottom")


ggplot(huevos, aes(Asymmetry, Ellipticity)) +
  geom_hex() +
  scale_fill_gradient(low = "#bbbbbb", high = "#000000") +
  labs(x = 'Asimetría', y = 'Forma elíptica', fill = 'Conteos') +
  theme_minimal(base_size = 14)


OrdenesAIncluir <- c('CHARADRIIFORMES', 'PASSERIFORMES')
huevos %>% filter(Order %in% OrdenesAIncluir) %>%
  ggplot(aes(Asymmetry, Ellipticity)) +
  geom_hex() +
  scale_fill_gradient(low = "#bbbbbb", high = "#000000") +
  labs(x = 'Asimetría', y = 'Forma elíptica') +
  theme_minimal(base_size = 14) +
  facet_wrap(~Order, ncol = 2)


### Ejemplo 2.12

modelo = function(e, s = "Western"){
  cara = (s == "Western")
  pred = 1.942435 - 0.002927*e - 1.777205*cara + 0.001196*cara*e
  return(1/(exp(-pred) + 1))
}


modeloE = function(e)
  return(modelo(e, "Eastern"))


ggplot(Depredador_Grad, aes(x= ELEV, y = PRED, shape = SLOPE,
                            color = TEMP)) +
  geom_point(size = 3) +
  geom_function(fun = modelo, linetype = "dashed") +
  geom_function(fun = modeloE) +
  theme_pubr(base_size = 13) +
  theme(legend.position = "top") +
  scale_colour_gradient(low = "white", high = "black") +
  labs(color = TeX("Temperatura $^{o}$C"),
       y = "Tasa depredación por hora",
       x = "Elevacion  (m.s.n.m)") +
  guides(shape = FALSE)


### Ejemplo 2.13

Cadaver = read.delim('Datos/Cadaver.txt')
CadaverP = Cadaver  %>%
  select(starts_with('P'), M, Rp) %>%
  rename("X" = POINT_X, "Y" = POINT_Y, "Depredador" = M,
         "Roedor" = Rp) %>%
  melt(measure.vars = c("Depredador","Roedor"),
       variable.name = "Animal",
       value.name = "Conteo") %>%
  filter(Conteo > 0)

ggplot(CadaverP, aes(X, Y, size = Conteo, shape=Animal,
                     color = Animal)) +
  geom_point(alpha = .6) + coord_fixed() +
  scale_colour_manual(values = c("gray50", "black")) +
  theme_minimal(base_size = 14) +
  theme(legend.text = element_text(size = 10),
        legend.title = element_text(size = 10),
        legend.key.size = unit(.2, 'cm'),
        legend.key.height= unit(.2, 'cm'),
        legend.key.width= unit(.2, 'cm'))


### Ejemplo 2.14

crec = read_excel('Datos/Crecimiento.xlsx', sheet = 1)
names(crec)[1:4] = c("ID", "Trat", "Sexo", "P3S")
crec = crec %>%
  mutate(Sexo = factor(Sexo, c("1.Macho", "2.Hembra"),
                       c("Macho", "Hembra"))) %>%
  melt(id.vars = c("ID","Trat","Sexo"), value.name = "peso") %>%
  mutate(semana = rep(3:12, each = 76))


crec %>%
  ggplot(aes(x = semana, y = peso, by = ID)) +
  geom_point(aes(shape = Sexo, colour = Sexo)) +
  geom_line(aes(colour = Sexo)) +
  scale_shape_manual(values = c(1, 16)) +
  scale_color_manual(values = c("gray40", "black")) +
  scale_x_continuous(breaks = 3:12) +
  labs(x = "Semana", y = "Peso (gr)") +
  facet_grid(cols = vars(Trat)) +
  theme(legend.position = "bottom") +
  theme_pubr()


#===================
# Sección 2.2
#===================

fy = function(x, A, E)
  return(forma(x, A+1, 1/(E+1))^2)


Vol = function(Asim, Elip, Long){
  xs = seq(-0.75, 0.75, 0.25)
  coeficientes = rep(4, 7)
  coeficientes[seq(2, 7, 2)] = 2
  return(pi*Long^3*sum(coeficientes*fy(xs,Asim,Elip))/96)
}

VolMatriz = function(x)
  return(Vol(x[1], x[2], x[3]))

Volumenes = apply(huevos[,5:7], 1, VolMatriz)



huevos$Volumen = Volumenes
p1 = ggplot(huevos, aes(`AvgLength (cm)`, Volumen)) +
  geom_point(alpha = 0.2) +
  labs(x = 'Longitud promedio (cm)',
       y = TeX('Volumen aproximado (cm$^3$)'))
p2 = ggplot(huevos,aes(`AvgLength (cm)`, Volumen)) +
  geom_point(alpha = .2) +
  scale_y_continuous(trans = 'log10') +
  scale_x_continuous(trans = 'log10') +
  labs(x = 'Longitud promedio (cm)',
       y = TeX('Volumen aproximado (cm$^3$)'))
p3 = huevos %>% filter(`AvgLength (cm)` <
                         quantile(`AvgLength (cm)`, .95) ) %>%
  ggplot(aes(`AvgLength (cm)`, Volumen)) +
  geom_point(alpha = .2) +
  labs(x = 'Longitud promedio (cm)',
       y = TeX('Volumen aproximado (cm$^3$)'))
p4 = huevos %>% filter(`AvgLength (cm)` <
                         quantile(`AvgLength (cm)`, .95) ) %>%
  ggplot(aes(`AvgLength (cm)`, Volumen)) +
  geom_point(alpha = 0.2) +
  scale_y_continuous(trans = 'log10') +
  scale_x_continuous(trans = 'log10') +
  labs(x = 'Longitud promedio (cm)',
       y = TeX('Volumen aproximado (cm$^3$)'))

ggarrange(p1, p2, p3, p4, labels = c("A", "B", "C","D"),
          ncol = 2, nrow = 2, align = "v")


#===================
# Sección 2.3
#===================

### Ejemplo 2.26

library(plotly)
plot_ly(huevos.SS, x = ~Asymmetry, y = ~Ellipticity,
        z = ~`AvgLength (cm)`, color = ~Order,
        colors = c('lightgray', 'black')) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'Asimetría'),
                      yaxis = list(title = 'Forma elíptica'),
                      zaxis = list(title = 'Longitud')),
         legend = list(orientation = 'h'))



library(FactoMineR)
OrdenesAIncluir <- c('STRIGIFORMES','SULIFORMES')
huevos.SS = huevos %>%
  dplyr::filter(Order %in% OrdenesAIncluir) %>%
  column_to_rownames(var="Species") %>%
  dplyr::select(Order, Asymmetry, Ellipticity,
                'AvgLength (cm)') %>%
  dplyr::mutate(Asim = scale(Asymmetry)[,1],
                Elip = scale(Ellipticity)[,1],
                Long = scale(`AvgLength (cm)`)[,1])

huevos.SS.acp <- PCA(huevos.SS[,5:6], graph=FALSE)
huevos.acp.dim = data.frame(huevos.SS.acp$ind$coord,
                            Order = huevos.SS$Order)
names(huevos.acp.dim)[1:2] = c("PC1", "PC2")
huevos.acp.dim$PC2 = -huevos.acp.dim$PC2

h1 = ggplot(huevos.SS, aes(x = Asim, y = Elip, color = Order)) +
  geom_point() +
  scale_color_manual(values = c("gray", "black")) +
  labs(x = 'Asimetría estandarizada',
       y = 'Forma elíptica estandarizada',
       color = "Orden") +
  geom_rug(col="steelblue", alpha=0.6) +
  geom_abline(intercept = 0, slope = 1, color="black",
              linetype="dotted") +
  geom_abline(intercept = 0, slope = -1, color="darkgray",
              linetype="dotted") +
  geom_curve(aes(x = 1, y = 1, xend = 1.41, yend = 0),
             curvature = -0.2,
             arrow = arrow(length = unit(0.03, "npc"))) +
  xlim(-2.45,2.45) + ylim(-2.45,2.45) +
  theme_minimal(base_size = 12)+coord_fixed() +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 10))

h2 = ggplot(huevos.acp.dim,
            aes(x = PC1, y = PC2, color = Order)) +
  geom_point() +
  scale_color_manual(values = c("gray", "black")) +
  labs(x = 'Primer componente principal',
       y = 'Segundo componente principal',
       color = "Orden") +
  geom_rug(col="steelblue",alpha=0.6) +
  xlim(-2.45,2.45) + ylim(-2.45,2.45) +
  geom_hline(yintercept=0, color="black", linetype="dotted") +
  geom_vline(xintercept=0, color="darkgray", linetype="dotted") +
  theme_minimal(base_size = 12) + coord_fixed() +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 10))

ggarrange(h1, h2, labels = c("A", "B"), ncol = 2,
          common.legend = TRUE)


library(FactoMineR)
OrdenesAIncluir <- c('STRIGIFORMES','SULIFORMES')
huevos.SS = huevos %>%
  dplyr::filter(Order %in% OrdenesAIncluir) %>%
  column_to_rownames(var = "Species") %>%
  dplyr::select(Order, Asymmetry, Ellipticity,
                'AvgLength (cm)') %>%
  dplyr::mutate(Asim = scale(Asymmetry)[,1],
                Elip = scale(Ellipticity)[,1],
                Long = scale(`AvgLength (cm)`)[,1])

huevos.SS.acp <- PCA(huevos.SS[,5:6], graph=FALSE)
huevos.acp.dim = data.frame(huevos.SS.acp$ind$coord,
                            Order = huevos.SS$Order)
names(huevos.acp.dim)[1:2] = c("PC1", "PC2")
huevos.acp.dim$PC2 = -huevos.acp.dim$PC2

h1 = ggplot(huevos.SS, aes(x = Asim, y = Elip, color = Order)) +
  geom_point() +
  scale_color_manual(values = c("gray", "black")) +
  labs(x = 'Asimetría estandarizada',
       y = 'Forma elíptica estandarizada',
       color = "Orden") +
  geom_rug(col = "steelblue", alpha = 0.6) +
  geom_abline(intercept = 0, slope = 1, color="black",
              linetype = "dotted") +
  geom_abline(intercept = 0, slope = -1, color="darkgray",
              linetype = "dotted") +
  geom_curve(aes(x = 1, y = 1, xend = 1.41, yend = 0),
             curvature = -0.2,
             arrow = arrow(length = unit(0.03, "npc"))) +
  xlim(-2.45, 2.45) + ylim(-2.45, 2.45) +
  theme_minimal(base_size = 12) + coord_fixed()

h2 = ggplot(huevos.acp.dim,
            aes(x = PC1, y = PC2, color = Order)) +
  geom_point() +
  scale_color_manual(values = c("gray", "black")) +
  labs(x = 'Primer componente principal',
       y = 'Segundo componente principal',
       color = "Orden") +
  geom_rug(col = "steelblue", alpha = 0.6) +
  xlim(-2.45, 2.45) + ylim(-2.45, 2.45) +
  geom_hline(yintercept=0, color="black", linetype="dotted") +
  geom_vline(xintercept=0, color="darkgray", linetype="dotted") +
  theme_minimal(base_size = 12) + coord_fixed()
ggarrange(h1, h2, labels = c("A", "B"), ncol = 2,
          common.legend = TRUE)


h.SS.acp = PCA(huevos.SS[, 1:4], graph = FALSE, quali.sup = 1)


fviz_pca_ind(h.SS.acp, geom = "point", habillage = "Order",
             addEllipses = TRUE, legend = "bottom",
             palette = c("#999999", "#000000"),
             title = "Proyección especies")

fviz_pca_ind(h.SS.acp, repel = TRUE, geom = c("point","text"),
             palette = c("#999999", "#000000"),
             habillage = "Order", addEllipses = TRUE,
             title = "Proyección especies", legend = "bottom")

h.SS.acp$svd$V

fviz_pca_var(h.SS.acp) + xlim(c(-1.2,1.2))


### Ejemplo 2.27

Craneo = read_excel('Datos/GSE55282.xlsx') %>%
  pivot_longer(cols = -GENE, names_to = "Muestra",
               values_to = "Expresion") %>%
  pivot_wider(names_from = "GENE",
              values_from = "Expresion")

CraneoM = read_csv('Datos/GSE55282Metadata.csv') %>%
  dplyr::rename(Muestra = 'Sample name', Grupo = Cluster,
                Condicion = type) %>%
  dplyr::select(Muestra, Grupo, Condicion)

Craneo = left_join(CraneoM, Craneo, by = "Muestra")

rownames(Craneo) = mapply(paste, substr(Craneo$Condicion, 1, 1),
                          1:31, sep = "")
Craneo.acp = PCA(Craneo, graph = FALSE, quali.sup = 1:3)

fviz_pca_ind(Craneo.acp, repel = TRUE, palette = "Dark2",
             habillage = "Condicion", legend ="bottom",
             title = "Proyección muestras") +
  labs(shape = "Condición", color = "Condición")


fviz_pca_ind(Craneo.acp, repel = TRUE, legend ="bottom",
             palette = "Dark2", habillage = "Grupo",
             title = "Proyección muestras")

Craneo.PC5 = data.frame(Craneo.acp$ind$coord,
                        Condicion = Craneo$Condicion)
ggplot(Craneo.PC5, aes(x = Condicion, y = Dim.1)) +
  geom_jitter(width = .05, height = 0) +
  labs(x = "Condición", y = "Primer componente principal") +
  scale_x_discrete(labels= c("Craneosinostosis", "Normal")) +
  theme_minimal(base_size = 14)

write_csv(Craneo.PC5,'Datos/CraneoPCA.csv')
