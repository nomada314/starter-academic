############################################################
# Código en `R` usado en el primer capítulo del libro:
# "Una introducción concisa a la inferencia estadística"
# escrito por Adriana López y Alex Rojas.
# https://alexrojas.netlify.com/publication/ie/
############################################################

# Capítulo 2

############################################################
### Sección 2.1
############################################################

#### Ejemplo 2.20

set.seed(31414)
# La muestra es ordenada para facilitar los cálculos
n = 20
muestraU10 = sort(runif(n,0,10))

# Estimadores
E1 = max(muestraU10)
E2 = min(muestraU10)/E1
E3 = 2*mean(muestraU10)
E4 = (n+1)*E1/n

# Estimador eliminando la i-ésima observación
E1s = c(rep(E1,n-1),muestraU10[n-1])
E2s = c(muestraU10[2],rep(muestraU10[1],n-1))/E1s
E3s = 2*(sum(muestraU10) - muestraU10)/(n-1)
E4s = n*E1s/(n-1)

# Estimación del sesgo
SesgoE1 = (n-1)*(mean(E1s)-E1)
SesgoE2 = (n-1)*(mean(E2s)-E2)
SesgoE3 = (n-1)*(mean(E3s)-E3)
SesgoE4 = (n-1)*(mean(E4s)-E4)

ErrorEstE1 = sqrt((n-1)^2*var(E1s)/n)
ErrorEstE2 = sqrt((n-1)^2*var(E2s)/n)
ErrorEstE3 = sqrt((n-1)^2*var(E3s)/n)
ErrorEstE4 = sqrt((n-1)^2*var(E4s)/n)

############################################################
### Sección 2.3
############################################################

#### Ejemplo 2.22

precip    = read.csv("LluviaIllinois.csv")[,1]
precip.k  = skewness(precip)
set.seed(31415)
precip.MBoot  = matrix(sample(precip,2270000,replace=TRUE),
                       nrow=10000)
precip.sesgo  = apply(precip.MBoot,1,skewness)
cat("Error estándar =", sd(precip.sesgo), "\n")

#### Ejemplo 2.23

set.seed(31415)
muestraGamma125      <- rgamma(25,1,1/25)
mediaMuestraGamma125 <- mean(muestraGamma125)
cat("Valor estimado de la media:  ",mediaMuestraGamma125)
MediaMuestral <- function(x, d)
  return(mean(x[d]))
rho.Boot <- boot(muestraGamma125,MediaMuestral,R=10000)
cat("Error estándar: ",sd(rho.Boot$t))


Gamma125.rn <- function(data, mle)
    return(rgamma(25,1, 1/mle))

set.seed(7653)
rho.Boot.param <- boot(muestraGamma125,MediaMuestral,R=10000,
                         sim="parametric", ran.gen =Gamma125.rn,
                         mle=mean(muestraGamma125))
cat("Error estándar bootstrap paramétrico:",
    sd(rho.Boot.param$t))

############################################################
### Sección 2.4
############################################################

#### Ejemplo 2.27

set.seed(31416)
MoMPois <- rpois(15,lambda = 2)
lambda1 <- mean(MoMPois)
lambda2 <- -0.5 + 0.5*sqrt(1+4*mean(MoMPois^2))

#### Ejemplo 2.29

lambda3 <- -log(mean(MoMPois==0))

#### Ejemplo 2.30

B <- 10000
muestraPoisson <- matrix(sample(MoMPois,15*B,
                                replace=TRUE),ncol=15)
lambda1.mom <- apply(muestraPoisson,1,mean)
lambda2.mom <- apply(muestraPoisson,1,
                     function(x){-.5+.5*sqrt(1+4*mean(x^2))})
lambda3.mom <- apply(muestraPoisson,1,
                     function(x){-log(mean(x==0))})
cat("Error estándar lambda 1", sd(lambda1.mom),"\n")
cat("Error estándar lambda 2", sd(lambda2.mom),"\n")
cat("Error estándar lambda 3",
    sd(lambda3.mom[which(!is.infinite(lambda3.mom))]))


#### Ejemplo 2.31

nlm(function(r)(gamma(2*r+1)/gamma(r+1)^2 -1)/r^2,2,
    gradtol=1e-8)$estimate


############################################################
### Sección 2.5
############################################################


#### Ejemplo 2.32

precip.mm <- function(data, d){
  m  <- mean(data[d])
  m2 <- mean(data[d]^2)
  out <- c(m^2,m)/(m2-m^2)
  return(out)
}
set.seed(7653)
ab.Boot.param <- boot(precip,precip.mm,R=2000)
cat("Error estándar bootstrap para alfa:",sd(ab.Boot.param$t[,1]))
cat("Error estándar bootstrap para beta:",sd(ab.Boot.param$t[,2]))


#### Ejemplo 2.40

uniroot(function(x)(digamma(x)- log(x) + 1.469824556),
        c(.1,1))$root

#### Ejemplo 2.41

rMuon <- function(n,alpha=0){
  if(abs(alpha) < 1){
    if(alpha == 0)
      return(runif(n,-1,1))
    else{
      u <- runif(n,0,1)
      return((sqrt(1-alpha*((2-alpha)-4*u))-1)/alpha)
    }
  }
  else
    stop("El parámetro alpha debe estar entre -1 y 1")
}
set.seed(31414)
x.Muon    <- rMuon(20,-.3)
# Función de verosimilitud
vero.Muon  <- function(alpha,x){prod((1+alpha*x)/2)}
# Función de log-verosimilitud
l.Muon     <- function(alpha,x){sum(log((1+alpha*x)/2))}
# Función score
S.Muon     <- function(alpha,x){return(sum(x/(1+alpha*x)))}
# Información de Fisher observada
J.Muon     <- function(alpha,x){return(sum(x^2/(1+alpha*x)^2))}
# Información de Fisher

cat("Método de momentos:\n El valor estimado es",3*mean(x.Muon),
    "\n")
cat("Método de máxima verosimilitud:\n El valor estimado es",
    uniroot(S.Muon,c(-1,1),x=x.Muon)$root)

#### Ejemplo 2.42

set.seed(31415)
muestrasGeo  <- matrix(rgeom(500000,0.5),ncol=50)
EMV.Geo      <- apply(muestrasGeo,1,function(x){1/(mean(x)+1)})
EMV.GeoScore <- (50- apply(muestrasGeo,1,sum))/.5


#### Ejemplo 2.48

resultados <- matrix(NA,ncol=2, nrow = 1)
flag <- TRUE
alpha.k <- 0.7      # valor inicial
resultados[1,] <- c(alpha.k,log(vero.Muon(alpha.k, x.Muon)))
while(flag){
  alpha.k1  <- alpha.k +
                  S.Muon(alpha.k, x.Muon)/J.Muon(alpha.k, x.Muon)
  resultados<- rbind(resultados,
                  c(alpha.k1,log(vero.Muon(alpha.k1, x.Muon))))
  flag      <- abs(alpha.k1-alpha.k)>0.0001
  alpha.k   <- alpha.k1
}

l.Muon2 <- function(alpha){sum(log((1+alpha*x.Muon)/2))}
maxLik(l.Muon2,start=.7)


#### Ejemplo 2.49

l.precip <- function(a,b)
  matrix(c(log(b)-digamma(a)-2.964185, a/b - 0.2243921),ncol=1)
H.precip <- function(a,b)
  matrix(c(trigamma(a),-1/b,-1/b,a/b^2),2,2)
theta0   <- matrix(c(0.1,1.0),ncol=1)
flag <- TRUE
while(flag){
  theta  <- theta0 + solve(H.precip(theta0[1],theta0[2]),
                           l.precip(theta0[1],theta0[2]))
  flag   <- sum(abs(theta-theta0))>0.00001
  theta0 <- theta
}

#### Ejemplo 2.51

nflK <- read.csv("nflK.csv")
s.nflK <- function(ab,y=nflK$gol,x=nflK$distancia){
  mu <- ab[1]+ab[2]*x
  theta <- 1/(1+exp(-mu))
  s0 <- y-theta
  s1 <- sum(s0)
  s2 <- sum(x*s0)
  return(matrix(c(s1,s2),ncol=1))
}
j.nflK <- function(ab,x=nflK$distancia){
  mu <- ab[1]+ab[2]*x
  theta <- 1/(1+exp(-mu))
  j0 <- theta*(1-theta)
  j1 <- sum(j0)
  j2 <- sum(x*j0)
  j4 <- sum(x^2*j0)
  return(matrix(c(j1,j2,j2,j4),ncol=2))
}

l.nflK <- function(ab,y=nflK$gol,x=nflK$distancia){
  thetas <- 1/(1+exp(-(ab[1]+ab[2]*x)))
  return(sum(y*log(thetas) + (1-y)*log(1-thetas)))
}

flag = TRUE
ab0 <- matrix(c(2,-.05),ncol=1)
lver.0 <- l.nflK(ab0)
while(flag){
  abk <- ab0 + solve(j.nflK(ab0))%*%s.nflK(ab0)
  lver.k <- l.nflK(abk)
  flag <- abs(lver.0-lver.k) > 0.00001
  ab0 <- abk
  lver.0 <- lver.k
}
cat("Valores estimados usando Newton-Raphson:", ab0,"\n")
modelo.NFL <-glm(formula = gol ~ distancia,
                 family = binomial(link = logit), data = nflK)
summary(modelo.NFL)


#### Ejemplo 2.52

I.Muon <- function(alpha){
          return(log((1+alpha)/(1-alpha))/(2*alpha^3)-
                   (1/alpha^2))}
resultados <- matrix(NA,ncol=2, nrow = 1)

flag   <- TRUE
alpha.k <- 0.7      # valor inicial
resultados[1,] <- c(alpha.k,log(vero.Muon(alpha.k, x.Muon)))
while(flag){
  alpha.k1  <- alpha.k +
    S.Muon(alpha.k, x.Muon)/(20*I.Muon(alpha.k))
  resultados<- rbind(resultados,
                     c(alpha.k1,log(vero.Muon(alpha.k1, x.Muon))))
  flag      <- abs(alpha.k1-alpha.k)>0.0001
  alpha.k   <- alpha.k1
}


#### Ejemplo 2.53

# Función de log-verosimilitud
lvero.Gen <- function(theta,Y= c(125,18,20,34)){
  t4 <- theta/4
  return(sum(Y*log(c(.5+t4,.25-t4,.25-t4,t4))))
}
Y= c(125,18,20,34)
Y234 = sum(Y[2:4])
resultados <- matrix(NA,ncol=2, nrow = 1)
theta.k <- 0.4      # valor inicial
resultados[1,] <- c(theta.k,lvero.Gen(theta.k))
flag   <- TRUE
while(flag){
  p <- theta.k/(2+theta.k)
  theta.k1  <- (p*Y[1]+Y[4])/(p*Y[1]+Y234)
  resultados<- rbind(resultados,
                     c(theta.k1,lvero.Gen(theta.k1)))
  flag      <- abs(theta.k1-theta.k)>0.0001
  theta.k   <- theta.k1
}


#### Ejemplo 2.54

lvero.adn <- function(theta,x= c(1,12,3,11,15,2,9,17,20,16))
  return(sum(log(theta[1]*dpois(x,theta[2])
                 +(1-theta[1])*dpois(x,theta[3]))))

Qt <- function(theta,x= c(1,12,3,11,15,2,9,17,20,16)){
  provL <- theta[1]*dpois(x,theta[2])
  provM <- (1-theta[1])*dpois(x,theta[3])
  return(provL/(provL+provM))
}

theta.k <- c(0.4, 7, 8)      # valores iniciales
resultados <- matrix(NA,ncol=4, nrow = 1)
x = c(1,12,3,11,15,2,9,17,20,16)
resultados[1,] <- c(theta.k,lvero.adn(theta.k))
flag   <- TRUE
while(flag){
  z <- Qt(theta.k)
  p <- mean(z)
  lambda <- weighted.mean(x, w=z)
  mu <- weighted.mean(x, w= (1-z))
  theta.k1 <- c(p,lambda,mu)
  resultados<- rbind(resultados,
                     c(theta.k1,lvero.adn(theta.k1)))
  flag      <- sqrt(sum((theta.k1-theta.k)^2))>0.0001
  theta.k   <- theta.k1
}


#### Ejemplo 2.55

set.seed(1035)
N <- 10
M <- 15
t0 <- 2
y <- rexp(N+M,0.5)
x <- y[1:N]
e <- as.numeric(y[(N+1):(N+M)]>t0)
K <- sum(e)
Xbar <- mean(x)
lambda.k <- 1/Xbar
flag <- TRUE
while(flag){
  p <- 1/(1-exp(-lambda.k*t0)) - 1
  lambda.k1 <- (N+M)/(N*Xbar + K*(t0+ (1/lambda.k))+
                  (M-K)*((1/lambda.k) - t0*p))
  flag <- abs(lambda.k1-lambda.k)>0.001
  lambda.k <- lambda.k1
}
cat("Valor estimado usando el algoritmo EM:",lambda.k)


#### Ejemplo 2.56

data(bearings)
n = length(bearings)
betas = 1
lambdas = 1/mean(bearings)
Q1 = function(beta,lambda,y){
  mi = 1 + beta*(1-exp(-lambda*y))
  out = n*log(lambda)+sum((mi-1)*log(1-exp(-lambda*y)))-
    lambda*sum(y)+sum(mi)*log(beta)-n*log(exp(beta)-1)
  return(out)
}

pasoM = function(beta,lambda,y){
  mi = 1 + beta*(1-exp(-lambda*y))
  beta = beta + (sum(mi)/beta - n/(1-exp(-beta)))/
    (sum(mi)/beta^2 - n*exp(-beta)/(1-exp(-beta))^2)
  lambda = lambda + (n/lambda + sum((mi-1)*y/(exp(lambda*y)-1))-
                       sum(y))/(n/lambda^2 + sum((mi-1)*y^2*
                                                  exp(lambda*y)/
                                                   (exp(lambda*y)
                                                    -1)^2))
  return(c(beta,lambda))
}

bandera = F
i = 1
while(!bandera){
  prov = pasoM(betas[i], lambdas[i],bearings)
  betas = c(betas,prov[1])
  lambdas = c(lambdas,prov[2])
  i = i + 1
  bandera = (sqrt((betas[i]-betas[i-1])^2 +
                    (lambdas[i]-lambdas[i-1])^2)<0.0001)
}
cat('Valor estimado de lambda:', lambdas[i],
    'y valor estimado de beta:\n', betas[i])


############################################################
### Sección 2.6
############################################################



#### Ejemplo 2.66

min.Retraso = c(101,43, 80,111,41,18,60,48,102,65,72,104,102,43)
maximoRetraso = max(min.Retraso)
pChiValues = pchisq(2*120/maximoRetraso, 2*(14+2+c(-1,0)))
media.A.Post = 120*pChiValues[1]/((14+2-1)*pChiValues[2])


#### Ejemplo 2.67

B = 10000
n = 10
k = 0.8
set.seed(31417)
sim.sigmas = sqrt(rinvgamma(B,(n-1)/2, 2/3.4))
sim.mu     = rnorm(B,0.5,sim.sigmas/sqrt(n))
muestra    = pnorm((k-sim.mu)/sim.sigmas)
cat("Probabilidad de no exceder ", k," es: ",mean(muestra),".",
    sep="")


#### Ejemplo 2.68

B = 10000
set.seed(2233)
muestraDistAPost <- -log(1-rbeta(B,25+1,50-25+1))
probInfeccion    <-  (1 - ppois(9, muestraDistAPost*10))
cat("Media de la distribución a posteriori:",
    mean(muestraDistAPost))

cat("Probabilidad de infección al tomar 10 litros de agua:",
    mean(probInfeccion))


#### Ejemplo 2.69

# Determina si el vector de probabilidades pertenece
# a la región R
esta.ordenado <- function(x)
  sum(order(x)==(1:length(x)))==length(x)
# Encuentra el valor j estrella, el mínimo valor tal que la
# probabilidad es mayor que p
mayorQueP <- function(prob, p = 0.5)
  which(prob>p)[1]

pago.i <- c(1,5,10,20,30,40,50,75,100,150,200)
n.i    <- c(31,29,27,25,23,21,19,17,15,15,15)
y.i    <- c(0,3,6,7,9,13,17,12,11,14,13)

B = 0
muestras.Utiles = matrix(NA, ncol=11,nrow=1000)
set.seed(36253)
while(B<1000){
  candidata <- rbeta(11, y.i+1, n.i - y.i +1)
  if(esta.ordenado(candidata)){
    B = B + 1
    muestras.Utiles[B,] = candidata
  }
}
deltas = pago.i[apply(muestras.Utiles,1,mayorQueP)]
delta.Estimado = mean(deltas)


#### Ejemplo 2.70

B = 10000
set.seed(31454)
thetas = rbeta(B,31,11)
h = function(theta) exp(-12*abs(theta-0.5))
cat('Valor estimado de theta:',
    mean(thetas*h(thetas))/mean(h(thetas)))

set.seed(31454)
thetas2 = runif(B)
r = function(theta)
    (theta^30)*((1-theta)^10)*exp(-12*abs(theta-0.5))
cat('Valor estimado de theta:',
    mean(thetas2*r(thetas2))/mean(r(thetas2)))


#### Ejemplo 2.71

B = 1000
N = 1000
mc.Normal = function(y){
  d.cauchy = dcauchy(y,10,1)
  return(sum(y*d.cauchy)/sum(d.cauchy))
}
mc.Cauchy = function(y, x){
  d.normal = dnorm(y,x,1)
  return(sum(y*d.normal)/sum(d.normal))
}
set.seed(7364)
mu.Cauchy = matrix(rcauchy(B*N, location=10, scale = 1), ncol=B)
mu.Normal = matrix(rnorm(B*N, 4.74, 1), ncol=B)
mus.cauchy = apply(mu.Cauchy,1, mc.Cauchy, x = 4.74)
mus.normal = apply(mu.Normal,1, mc.Normal)

#### Ejemplo 2.72

B = 1000
N = 1000
h.Z = function(x)
  mean(x>3)

# Método de Monte Carlo
set.seed(86242)
muestraZ = matrix(rnorm(B*N),ncol=N)
theta    = apply(muestraZ, 1, h.Z)

# Muestreo ponderado, mu = 3
set.seed(86242)
muestraG = matrix(rnorm(B*N,3),ncol=N)
pesos    =  dnorm(muestraG)/dnorm(muestraG,3)
theta.P  = apply((muestraG>3)*pesos, 1,mean)


#### Ejemplo 2.74

Y= c(125,18,20,34)
B = 10000
cadena.theta = rep(.5,B)
cadena.z2 =  rep(125*(.5/(2+.5)),B)
a = Y[4]+1; b = Y[2]+Y[3]+1
set.seed(72622)
for(j in 2:B){
  cadena.theta[j] <- rbeta(1,cadena.z2[j-1]+a,b)
  cadena.z2[j]    <- rbinom(1,Y[1],(cadena.theta[j]/
                                      (2+cadena.theta[j])))
}


#### Ejemplo 2.75

nfl.Gibbs <- function(X, n=512, B=10000, tau=20, eliminar=1000){
  cadena.lambda = rep(0.3,B)
  cadena.beta = rep(1,B)
  for(i in 2:B){
    cadena.lambda[i] = rgamma(1, X+1, cadena.beta[i-1]+n)
    cadena.beta[i] = rgamma(1, 2, tau+cadena.lambda[i])
  }
  return(list(c.l=cadena.lambda[(eliminar+1):B],
              c.b=cadena.beta[(eliminar+1):B]))
}
set.seed(87251)
nfl.G.res = nfl.Gibbs(171)


#### Ejemplo 2.76


data(Energy)
Energia = log(Energy)
m.g = mean(Energia$Girls)
m.b = mean(Energia$Boys)
mu.0 = 6.8
a1 = a2 = a3 = 1
b1 = b2 = b3 = 10

c.mu = rep(8,6000)
c.tau2 = rep(3,6000)
c.sigma2 = rep(2,6000)
c.sigma2.mu = rep(3,6000)
c.theta1 = rep(6.5,6000)
c.theta2 = rep(7,6000)
set.seed(12345)
for(s in 2:6000){
  p1denom = c.sigma2[s-1]+16*c.tau2[s-1]
  m.theta1 = (c.sigma2[s-1]*c.mu[s-1]+16*c.tau2[s-1]*m.g)/p1denom
  m.theta2 = (c.sigma2[s-1]*c.mu[s-1]+16*c.tau2[s-1]*m.b)/p1denom
  c.theta1[s] = rnorm(1,m.theta1,sqrt(c.sigma2[s-1]*c.tau2[s-1]/
                                        p1denom))
  c.theta2[s] = rnorm(1,m.theta2,sqrt(c.sigma2[s-1]*c.tau2[s-1]/
                                        p1denom))
  p2denom = c.tau2[s-1]+2*c.sigma2.mu[s-1]
  m.theta = (c.theta1[s]+c.theta2[s])/2
  m.mu = (c.tau2[s-1]*mu.0+2*c.sigma2.mu[s-1]*m.theta)/p2denom
  c.mu[s] = rnorm(1,m.mu,sqrt(c.sigma2.mu[s-1]*c.tau2[s-1]/
                                p2denom))
  pre.Suma = Energia - matrix(c(c.theta1[s],c.theta2[s]),
                      nrow=16,ncol=2,byrow = TRUE)
  c.sigma2[s] = rinvgamma(1,16+a1,0.5*sum(pre.Suma^2)+b1)
  c.tau2[s] = rinvgamma(1,1+a2,
      0.5*((c.theta1[s]-c.mu[s])^2+(c.theta2[s]-c.mu[s])^2)+b2)
  c.sigma2.mu[s] = rinvgamma(1,0.5+a3,0.5*(c.mu[s]-mu.0)^2+b3)
}
