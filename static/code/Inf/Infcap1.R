############################################################
# Código en `R` usado en el primer capítulo del libro:
# "Una introducción concisa a la inferencia estadística"
# por Adriana López y Alex Rojas.
# https://alexrojas.netlify.com/publication/ie/
############################################################

# Capítulo 1

## Sección 1.5. Método de MonteCarlo

### Ejemplo: Distancia promedio entre dos puntos

B  <- 100000
# Se generan B parejas de puntos en tres dimensiones
set.seed(123)
puntos <- matrix(runif(B*6), ncol=6)
distancias <- apply(puntos,1,
                    function(x){sqrt(sum((x[1:3]-x[4:6])^2))})
cat("Distancia promedio aproximada:", mean(distancias), "usando", B, "muestras.")


### Ejemplo: Black-Scholes

BS <-  function(S0=1000,sigma=0.1,T=1,r=0.06,K = S0){
  C <- (log(K/S0)-(r-sigma^2/2)*T)/(sqrt(T)*sigma)
  return(S0*pnorm(sigma*sqrt(T)-C)-K*exp(-r*T)*pnorm(-C))
}

BSMC <- function(S0=1000,sigma=0.1,T=1, r=0.06,K = S0, Zs ){
       st <- S0*exp((r-sigma^2/2)*T+sigma*sqrt(T)*Zs)
       v  <- exp(-r*T)*pmax(0,(st-K))
       return(v)
}

set.seed(31415)
Z <- rnorm(10000)
ValoresEstimados1 <- BSMC(Zs = Z)
cat("Valores presente de la opción:",BS())
cat("Valores presente de la opción estimado:",mean(ValoresEstimados1))
