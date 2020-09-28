############################################################
# Código en `R` usado en el primer capítulo del libro:
# "Una introducción concisa a la inferencia estadística"
# escrito por Adriana López y Alex Rojas.
# https://alexrojas.netlify.com/publication/ie/
############################################################

# Capítulo 4

############################################################
### Sección 4.1
############################################################

#### Ejemplo 4.2

p.mu = function(mu)
  return(exp(-mu^2/20)/((1+(mu+4.3)^2)*(1+(3.2-mu)^2)))
const.Norm = integrate(p.mu,-30,30)
p.mu = function(mu, cn=const.Norm$value)
  return(exp(-mu^2/20)/(cn*(1+(mu+4.3)^2)*(1+(3.2-mu)^2)))

mu.malla = seq(-10,10,length=10001) # Partición intervalo [-10,10]
post.mu  = p.mu(mu.malla)           # distribución a posteriori
F.mu  = cumsum(post.mu*.002)        # CDF aproximada

# Intervalo con colas iguales
lim.i = mu.malla[which(F.mu >0.025)[1] ]
lim.s = mu.malla[which(F.mu >0.975)[1] ]

# HPD
delta = 0.01; k = 0.07
while(delta > 0.00001){
  prov = which(post.mu>k)
  lim.i = mu.malla[prov[1] ]
  lim.s = mu.malla[prov[length(prov)] ]
  intIS = integrate(p.mu,lim.i,lim.s)$value
  if(intIS<0.95){
    k = k - delta
    intIS0 = intIS
  }
  else{
    k = k + 9*delta/10
    delta = delta/10
  }
}
cat("Intervalo HPD: (",lim.i,",",lim.s,")" )


#### Ejemplo 4.3

IntConfAgua.Prob  = hdi(probInfeccion)
cat("Intervalo de credibilidad para la probabilidad de
infección:" ,"\n", IntConfAgua.Prob)

IntConfAgua.Lambda = hdi(muestraDistAPost)
IntConfAgua.Prob2 = 1-ppois(9,IntConfAgua.Lambda*10)


IntConfAgua.Prob3 = quantile(probInfeccion,probs = c(.025,.975))
IntConfAgua.Prob4 = 1-ppois(9,quantile(muestraDistAPost,
                                       probs = c(.025,.975))*10)
cat("Intervalo de credibilidad del 95% con probabilidad igual
en las dos colas\n",
    "- usando la muestra de la distribución a posteriori de
   lambda:", IntConfAgua.Prob4,"\n",
    "- usando la muestra de la distribución a posteriori de
   theta:", IntConfAgua.Prob3)


############################################################
### Sección 4.2
############################################################

#### Ejemplo 4.5

sumaG125 <- sum(muestraGamma125)
ICExp.lambda<- qgamma(c(0.05/2,1-0.05/2),25,1)/sumaG125
ICExp.lambda2<- qgamma(c(0.04,0.99),25,1)/sumaG125


#### Ejemplo 4.10

ICMuon <- function(alpha, x, g=0)
  return(-sum( log(1 - .25*(alpha*x^2 + 2*x+2-alpha))) - g)

cat("Intervalo de confianza: (",
 uniroot(ICMuon,c(-1,1),x=x.Muon, g= qgamma(.95,20,1))$root,",",
 uniroot(ICMuon,c(-1,1),x=x.Muon, g= qgamma(.05,20,1))$root,").",
 sep="")

#### Ejemplo 4.12

# Intervalo de confianza del 100(1-alpha)%
# Primer método, estimando la varianza asintótica
ICAsimp.Geom = function(x, alpha=.05){
  xBar = mean(x)
  return((1/(1+xBar))+
           qnorm(c(alpha/2,1-alpha/2))*
           sqrt(xBar/(length(x)*(1+xBar)^3)))
}
cat("Intervalo de confianza del 95% primera muestra estimando",
    "\n la varianza:(",
    ICAsimp.Geom(muestrasGeo[1,]),")\n",sep="")

ICSimulacion.Geom = apply(muestrasGeo,1,ICAsimp.Geom)
cobertura.Geom = (ICSimulacion.Geom[1,]<0.5)&
  (ICSimulacion.Geom[2,]>0.5)
cat("% Cobertura primer método: ", mean(cobertura.Geom)*100,
    "\n",sep="")


# Segundo método, encontrando directamente los valores de theta
ICAsimp.Geom2 = function(x, alpha=.05, dis=FALSE){
  xMLE = 1/(1+mean(x))
  n = length(x)
  A = qnorm(alpha/2)^2
  B = n-A
  C = -2*n*xMLE
  D = n*xMLE^2
  if(dis){
    discriminante = 18*A*B*C*D-4*B^3*D+B^2*C^2-4*A*C^3-27*A^2*D^2
    cat("Discriminante:", discriminante,"\n")
  }
  raices = Re(polyroot(c(D,C,B,A)))
  return(raices[which(raices>0)])
}
cat("Intervalo de confianza del 95% primera muestra usando el ",
    "segundo \n  método: (",
    ICAsimp.Geom2(muestrasGeo[1,],dis=TRUE),")\n",sep="")


ICSimulacion.Geom2 = apply(muestrasGeo,1,ICAsimp.Geom2)
cobertura.Geom2 = (ICSimulacion.Geom2[1,]<0.5)&
  (ICSimulacion.Geom2[2,]>0.5)
cat("% Cobertura segundo método: ", mean(cobertura.Geom2)*100,
    "\n",sep="")

#### Ejemplo 4.16

confint.default(modelo.NFL)


#### Ejemplo 4.17

alphaEMV = function(a, b = -.1, y=nflK$gol,x=nflK$distancia)
  return(sum(y)- sum(1/(1+exp(-(a+b*x)))))

perfil.beta.nflK <- function(b,y=nflK$gol,x=nflK$distancia){
  alpha  <- uniroot(alphaEMV,interval=c(0,10), b=b)$root
  thetas <- 1/(1+exp(-(alpha+b*x)))
  return(sum(y*log(thetas) + (1-y)*log(1-thetas)) -
           l.nflK(abk)+qchisq(.95,1)/2)
}

cat("Intervalo de confianza del 95%: (",
    uniroot(perfil.beta.nflK,c(-.135,-.12))$root,
    uniroot(perfil.beta.nflK,c(-.11,-.09))$root,")", sep="")

confint(modelo.NFL)

#### Ejemplo 4.19

binom.confint(51,8197, methods=c("asymptotic","wilson","ac"))


#### Ejemplo 4.21

EnlaceGenetico.MLE = function(Y, n=197){
  b = -Y[1]+2*(Y[2]+Y[3])+Y[4]
  return((-b + sqrt(b^2+8*n*Y[4]))/(2*n))
}
theta.MLE = EnlaceGenetico.MLE(c(125,18,20,34))
vector.probab =  c(.5+theta.MLE/4,(1-theta.MLE)/4,
                   (1-theta.MLE)/4,theta.MLE/4)
set.seed(37652)
muestrasBoot = rmultinom(10000, size = 197, prob = vector.probab)
theta.estrella = apply(muestrasBoot,2,EnlaceGenetico.MLE)
cat("Intervalo de confianza al 95%:(",
    theta.MLE + c(-1,1)*1.96*sd(theta.estrella),")",
    sep="")


#### Ejemplo 4.24

alpha <- 0.05
aICGamma125 <- mean(muestraGamma125)+
  qnorm(c(alpha/2,1-alpha/2))*sd(rho.Boot$t)
bICGamma125 <- quantile(rho.Boot$t,c(alpha/2,1-alpha/2))
cICGamma125 <- 2*mean(muestraGamma125) - rev(bICGamma125)
dICGamma125 <- sum(muestraGamma125)/
  rev(qgamma(c(alpha/2,1-alpha/2),25,1))


#### Ejemplo 4.25

data("Skateboard")
mPatineta <- Skateboard %>% filter(Experimenter=="Female") %>%
  select(Testosterone)
hPatineta <- Skateboard %>% filter(Experimenter=="Male") %>%
  select(Testosterone)
B <- 15000
alpha = 0.05
Testo.Boot <- matrix(NA,nrow=B,ncol=2)
set.seed(31542)
for(i in 1:B){
  sMujeres  <- sample(mPatineta$Testosterone, 49, replace = TRUE)
  sHombres  <- sample(hPatineta$Testosterone, 22, replace = TRUE)
  Testo.Boot[i,1] <-  mean(sMujeres) - mean(sHombres)
  Testo.Boot[i,2] <-  median(sMujeres) - median(sHombres)
}
Media.Testo <- mean(mPatineta$Testosterone)-
  mean(hPatineta$Testosterone)
Mediana.Testo <- median(mPatineta$Testosterone)-
  median(hPatineta$Testosterone)
cat("Intervalo de confianza del 95% para la diferencia de medias:
     \n(", rev(2*Media.Testo-
              quantile(Testo.Boot[,1],c(alpha/2,1-alpha/2))),
    ")\n")
cat("Intervalo de confianza del 95% para la diferencia de
     medianas:\n(", rev(2*Mediana.Testo-
              quantile(Testo.Boot[,2],c(alpha/2,1-alpha/2))),
    ")\n")
