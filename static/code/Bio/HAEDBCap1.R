#============================================================================
# Herramientas para el análisis estadístico de datos biológicos en R
# Capítulo 1. Introducción
# Autores: Adriana López, Mónica Rojas Peña y Alex Rojas
#============================================================================

library(knitr)
library(kableExtra)

#===================
# Sección 1.3
#===================

log(21)
setwd("./Bio")

nucleotidos = c("A", "C", "G", "T")
numerosAleatorios = runif(1000)
paginaD = 'https://pagina.com/Data/Bio'


MediaYVarianza = function(x){
  salida = c(mean(x), var(x))
  return(salida)
}

MediaYVarianza(1:10)
MediaYVarianza(numerosAleatorios)

set.seed(6273)
numerosAleatorios = runif(1000)
MediaYVarianza(numerosAleatorios)

install.packages(c("ggplot2","tidyverse","readxl"))

library(ggplot2)
library(tidyverse)
library(readxl)
library(MASS)


#===================
# Sección 1.3.1
#===================

### Ejemplo 1.6
Depredador_Grad = read_csv(file = "Datos/Camacho_ELEV.csv")
Depredador_Grad = read_csv("Datos/Camacho_ELEV.csv")

# Cuando el archivo se accesa en la página del libro:
#Depredador_Grad = read_csv("https://alexrojas.netlify.com/Data/Bio/Camacho_ELEV.csv")



TipoVar = cols(SLOPE = col_factor(c("Eastern", "Western")),
               X = "d", Y = "d", ELEV = "d", TEMP = "d",
               PRED = "d")
Depredador_Grad = read_csv("Datos/Camacho_ELEV.csv",
                           col_types = TipoVar)


TipoVar = cols(SLOPE = col_factor(c("Eastern", "Western")))
Depredador_Grad = read_csv("Datos/Camacho_ELEV.csv",
                           col_types = TipoVar)

# Cuando el archivo se accesa en la página del libro:
#Depredador_Grad = read_csv("https://alexrojas.netlify.com/Data/Bio/Camacho_ELEV.csv",
#                           col_types = TipoVar)



### Ejemplo 1.7
Herradura = read_table("Datos/cangrejos.dat")

TipoVar = cols(crab="i", sat="i", y = "i", color="f", spine="f")
Herradura = read_table("Datos/cangrejos.dat",
                       col_types = TipoVar)

Herradura$color

TipoVar = cols(crab = "i", sat = "i", y = "i",
               color = col_factor(c("1", "2", "3", "4")),
               spine = col_factor(c("1", "2", "3")))
Herradura = read_table("Datos/cangrejos.dat", col_types = TipoVar)



### Ejemplo 1.8
library(readxl)
Peckoltia = read_xls("Datos/Peckoltia2015.xls")


### Ejemplo 1.9
library(seqinr)
levadura = read.fasta("Datos/NONCODEv5_yeast.fa")

levadura1.df =  data.frame(Sec1 = getSequence(levadura[[1]]))

### Ejemplo 1.10

install.packages("BiocManager")
library(BiocManager)
install("Hiiragi2013")

library(Hiiragi2013)
data("x")

expresion = exprs(x)


#===================
# Sección 1.3.2
#===================

names(Peckoltia)
head(Peckoltia)
tail(Peckoltia)
str(Peckoltia)

# Selección de variables
Peckoltia.1 = select(Peckoltia, 'Dentary tooth cup L.',
                     'Premax. tooth cup L.', 'Predorsal L. 2',
                     'Head L. 2', 'Thorax L. 2')
Peck.Mouth = select(Peckoltia, starts_with('Mouth'))
Peckoltia.2 = select(Peckoltia, 'Predorsal L. 2':'SL 2')

# Renombrar variables
Peckoltia.1 = rename(Peckoltia.1, "DCopa"='Dentary tooth cup L.',
                     "PCopa" = 'Premax. tooth cup L.', "Torax" = 'Thorax L. 2',
                     "Predorsal"='Predorsal L. 2', "Cabeza"='Head L. 2')

Peckoltia.1 = rename(Peckoltia.1, 'PDorsal' = Predorsal)


# Filtración de individuos

Peckoltia.3 = filter(Peckoltia.1, PDorsal < 42)
Peck.Mouth2 = filter(Peck.Mouth, `Mouth L.` > mean(`Mouth L.`))
Peckoltia.4 = filter(Peckoltia.2,
                     `Head L. 2` < 29 | `Head L. 2` > 46)


Herradura[11:20,]
slice(Herradura, 11:20)

slice_max(Herradura, sat)

slice_min(Herradura, weight)



# Creación nuevas variables
Peckoltia.3 = mutate(Peckoltia.3, Diferencia = DCopa - PCopa)
Peck.Mouth2 = mutate(Peck.Mouth2, Area = `Mouth L.`*`Mouth W.`)
Peckoltia.4 = mutate(Peckoltia.4,
                     Predorsal.Est =scale(`Predorsal L. 2`) )


HerraduraOrd = arrange(Herradura, desc(sat), weight)


#  Operador %>%

Pecko.Final = Peckoltia %>%
  select(starts_with("Head"), `Snout L.`,
         `Thorax L.`, `Abdominal L.`) %>%
  select(ends_with("L.")) %>%
  select(-`Head-pectoral L.`) %>%
  mutate(Grupo = (`Thorax L.` > median(`Thorax L.`))+
           (`Abdominal L.` > median(`Abdominal L.`)) -1)%>%
  filter(`Snout L.` >
           quantile(`Snout L.`,.25, na.rm=TRUE))%>%
  select(-`Snout L.`, -`Thorax L.`,
         -`Abdominal L.`)%>%
  rename(Cabeza=`Head L.`,
         CabezaDorso =`Head-dorsal L.`,
         CabezaOjo = `Head-eye L.`)


### Ejemplo 1.11

Depredador_Grad %>%
  mutate(ELEV2 = ceiling(ELEV/500)) %>%
  select(X, Y, ELEV2) %>%
  write_csv("Depredador_Grad2.csv")

### Ejemplo 1.12

library(tidyverse)

# Establece directorio de trabajo
setwd('DIR/Bio')

# Lectura de la base de datos
TipoVar = cols(crab = "i", sat = "i", y = "i",
               color = col_factor(c("1", "2", "3", "4")),
               spine = col_factor(c("1", "2", "3")))
Herradura = read_table("Datos/cangrejos.dat",
                       col_types = TipoVar)

# Cambio de nombre de las variables y creación del
# archivo `Herradura.csv' en disco duro
Herradura = rename(Herradura, cangrejo = crab, satelites = sat,
                   peso = weight, ancho = width,
                   espina = spine)
Herradura %>% write_csv("Datos/Herradura.csv")


### Ejemplo 1.13


Herradura = dplyr::rename(Herradura, cangrejo = crab,
                          satelites = sat, peso = weight,
                          ancho = width, espina = spine)
Sat10 = Herradura %>% filter(satelites == 10)

Sat10 %>% kable('pipe', caption = '(ref:Sat10impl)') %>%
  kableExtra::kable_styling(latex_options = "hold_position")

library(reshape2)
Sat10Largo = Sat10 %>% melt()

Sat10Largo %>%
  kable("pipe", caption='(ref:Sat10meltl)') %>%
  kableExtra::kable_styling(latex_options = "hold_position")

Sat10Largo = Sat10 %>% melt(id.vars = "cangrejo",
                            measure.vars=c("peso","ancho", "color", "espina"))

Sat10 %>% melt(id.vars = "cangrejo",
               measure.vars=c("peso","ancho", "color", "espina"))  %>%
  kable("pipe", caption = '(ref:Sat10melt2l)') %>%
  kableExtra::kable_styling(latex_options = "hold_position")


### Ejemplo 1.14

ubicacion = c("1416967_at", "1420085_at", "1418863_at",
              "1425463_at")
nombreGenes = c("Sox2", "Fgf4",  "Gata4", "Gata6")
genes = as.data.frame(expresion) %>%
  rownames_to_column('gen') %>%
  filter(gen %in% ubicacion) %>%
  melt(id.vars = "gen", variable.name = c("Muestra"),
       value.name = "Valores")
genes$gen = factor(genes$gen, levels = ubicacion)



#===================
# Sección 1.3.3
#===================


Herradura %>% summarize(m = mean(peso),
                        de = sd(peso),
                        md = median(peso))


dplyr::summarize(Herradura,
                 across(4:5,
                        list(m = mean,
                             de = sd,
                             md = median)))


Herradura %>% melt(id.vars = "cangrejo",
                   measure.vars = c("satelites", "y", "peso",
                                    "ancho"),
                   variable.name = "VariablesNumericas") %>%
  group_by(VariablesNumericas) %>%
  summarize(Promedio = mean(value),
            DesvEst = sd(value),
            Mediana = median(value)) %>%
  kable("pipe")


Herradura %>% melt(id.vars = "cangrejo",
                   measure.vars = c("satelites", "y","peso",
                                    "ancho"),
                   variable.name = "VariablesNumericas") %>%
  group_by(VariablesNumericas) %>%
  summarize(Promedio = mean(value),
            DesvEst = sd(value),
            Mediana = median(value)) %>%
  kable("pipe", caption = '(ref:herraduraEst2ShowL)',
        col.names =c("Variables numéricas", "Promedio",
                     "Desviación estándar", "Mediana")) %>%
  kableExtra::kable_styling(latex_options = "hold_position")


Herradura %>% melt() %>%
  group_by(variable) %>%
  summarize(media = mean(value),
            DesvEst = sd(value),
            mediana = median(value)) %>%
  kable("pipe")


Herradura %>% group_by(espina) %>%
  summarize(media = mean(peso),
            DesvEst = sd(peso),
            mediana = median(peso)) %>%
  kable("pipe")


Herradura %>% group_by(espina) %>%
  summarize(media = mean(peso),
            DesvEst = sd(peso),
            mediana = median(peso)) %>%
  kable("pipe", caption = '(ref:herraduraEst4ShowL)',
        col.names = c("Estado espina dorsal","Promedio",
                      "Desviación estándar", "Mediana")) %>%
  kableExtra::kable_styling(latex_options = "hold_position")

### Ejemplo 1.15


genes.Reg = read_table("Datos/ReguladoresConteos.txt")
Tabla.Genes.Reg = genes.Reg %>% group_by(ngenes) %>%
  summarize(frec = n())

Tabla.Genes.Reg  %>%
  summarize(m = sum(ngenes*frec)/sum(frec))

### Ejemplo 1.16

gariepinusIG = read_excel('Datos/CgariepinusGrupoIndvidual.xlsx')

gariepinusIG = gariepinusIG %>%
  dplyr::select(fish:socialtrt) %>%
  mutate(O2 = factor(O2sat, levels = c(100, 20)),
         socialtrt = factor(socialtrt,
                            levels = c("alone", "group"),
                            labels = c("Solo", "Grupo")),
         Fgrupo = interaction(socialtrt, fish))


gariepinusIG  = gariepinusIG %>%
  arrange(O2sat) %>%
  group_by(Fgrupo)  %>%
  mutate(Cambio = factor(sign(breaths[1] - breaths[2]),
                         levels = c("-1", "0", "1"),
                         labels = c("Menor", "Igual", "Mayor")))


round(prop.table(
  table(gariepinusIG$socialtrt, gariepinusIG$Cambio),
  margin = 1), 3) %>%
  kable("pipe", col.names=c("Disminuyó", "Igual", "Aumentó"))


round(prop.table(
  table(gariepinusIG$socialtrt, gariepinusIG$Cambio),
  margin = 1), 3) %>%
  kable("pipe", caption = "(ref:pezgatoManipulacion3CodShowL)",
        col.names=c("Disminuyó", "Igual", "Aumentó")) %>%
  kableExtra::kable_styling(latex_options = "hold_position")


gariepinusIG %>%
  drop_na(Cambio) %>%
  group_by(Cambio, socialtrt) %>%
  summarize(frec = n()) %>%
  group_by(socialtrt) %>%
  mutate(prop = frec/sum(frec)) %>%
  dcast(socialtrt ~ Cambio) %>%
  kable("pipe", col.names=c("Tratamiento", "Disminuyó",
                            "Igual", "Aumentó"))
