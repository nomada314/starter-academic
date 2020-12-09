+++
date      = 2020-12-09
lastmod   = 2020-12-09
draft     = false
title     = "PariGP y SageMath"
math      = true
+++

[Página oficial Pari/GP](https://pari.math.u-bordeaux.fr/) y [Página oficial SageMath](https://www.sagemath.org/)

Podemos encontrar y almacenar la representación en base $p$ de un número $n$ así `n + O(p^e)`, donde `e` es la precisión deseada, por ejemplo, 

```{python}
a = 157 + O(5^20)
b = -1 + O(5^20)
c = 24 + O(3^20)
d = 17 + O(3^20)
```

Para obtener los dígitos usamos la función `digits()`:

```{python}
digits(157,5)
```

*** Sin embargo, dado que queremos "elevar" de $Z/nZ$ a $Z$, 

```{python}
digits(lift(b),5)
concat("...",concat([Str(x)|x<-digits(lift(b), 5 )]))
```

Podemos hacer cálculos con estos números:

```{python}
1 + b
a*b
a*b + a
rCD = c/d
concat("...",concat([Str(x)|x<-digits(lift(rCD),rCD.p)]))
c/3
concat("...",concat([Str(x)|x<-digits(lift(c/3),3)]))
log(c)
log(a)
sqrt(6 + O(5^20))
sqrt(9 + O(5^20))
sqrt(8 + O(5^20))
```

La última línea de código produce un error. 


