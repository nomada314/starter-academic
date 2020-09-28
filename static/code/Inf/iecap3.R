############################################################
# Código en `R` usado en el primer capítulo del libro:
# "Una introducción concisa a la inferencia estadística"
# escrito por Adriana López y Alex Rojas.
# https://alexrojas.netlify.com/publication/ie/
############################################################

# Capítulo 3

############################################################
### Sección 3.1
############################################################


#### Ejemplo 3.9

set.seed(1234)
x <- rnorm(25,7,2)
cat("p-valor:", 1-pnorm(sum(x),25*6, sqrt(25*4)))


#### Ejemplo 3.10

set.seed(2635)
B = 10000; n = 10
x1 = matrix(rexp(B*n,1),ncol=10)
sumas1 = apply(x1,1,sum)
pValores1 = pgamma(sumas1,n,1)
x2 = matrix(rexp(B*n,1.5),ncol=10)
sumas2 = apply(x2,1,sum)
pValores2 = pgamma(sumas2,n,1)



############################################################
### Sección 3.3
############################################################

#### Ejemplo 3.17

Verizon  = read.csv("Verizon.csv",head=TRUE)
medianas = tapply(Verizon$Time, Verizon$Group, median)
# Alternativamente:
# medianas = Verizon %>% group_by(Group) %>%
#            summarise(med=median(Time))
B = 10000
set.seed(6257)
VerMed = two.boot(Verizon$Time[1:1664],Verizon$Time[1665:1685],
                  median, B)
W = diff(medianas)/sd(VerMed$t)


#### Ejemplo 3.19

cat("Estadística de prueba score:",
(1/sqrt(length(precip)))*(1/trigamma(.8))*
  (length(precip)*log(.8/mean(precip))+
     sum(log(precip))-227*digamma(.8)))


#### Ejemplo 3.20

n = 25
lambda0 = 0.05
R = sqrt(n)*(1-mediaMuestraGamma125*lambda0)
Lambda  = 2*n*(lambda0*mediaMuestraGamma125-
                 log(lambda0*mediaMuestraGamma125)-1)
W = sqrt(n)*(lambda0/mediaMuestraGamma125 - lambda0^2)


############################################################
### Sección 3.4
############################################################

prov0  <- seq(0.5,50)
prov1  <- 2*abs(prov0-25)<20
prov2  <- 2*abs(prov0-9)<7
region <- prov1%o%prov1 + prov2%o%prov2
set.seed(31415)
tvalor <- matrix(rt(2500,20,ncp = 3*region),ncol=50)
pvalor <- 2*pt(abs(tvalor),20,lower.tail=FALSE)

NoRechazar <- abs(tvalor) < qt(.995,20)
Robs <- sum(NoRechazar)
Sobs <- sum((1-NoRechazar)*region)

data(golub)
grupo  <- factor(rep(c("ALL","AML"),c(27,11)))
tEstat <- mt.teststat(golub,grupo)

tEstat.tp <- apply(golub,1,function(x,clase){
  unlist(t.test(x ~ clase)[c("statistic","p.value")])},
  clase=grupo)
pvalores.Ajus <- mt.rawp2adjp(tEstat.tp[2,],
                             c("Bonferroni","Holm","SidakSS",
                               "BH"))
