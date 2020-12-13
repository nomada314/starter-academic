+++
date      = 2020-12-09
lastmod   = 2020-12-09
draft     = true
title     = "PariGP y SageMath"
math      = true
+++

[Página oficial Pari/GP](https://pari.math.u-bordeaux.fr/) y [Página oficial SageMath](https://www.sagemath.org/)

Podemos encontrar y almacenar la representación en base $p$ de un número $n$ así `n + O(p^N)`, donde `N` es la precisión deseada, por ejemplo, 

```{python}
a = 157 + O(5^20)
b = -1 + O(5^20)
c = 24 + O(3^20)
d = 17 + O(3^20)
```

Esta representación es de la forma $a + p^N\mathbb{Z}_p$ o, en otras palabras $a+O(p^N)$:

$$ a = a_vp^v + a_{v+1}p^{v+1}+\cdots + a_{N-1}p^{N-1} + \text{?}p^N+ \text{?}p^{N+1}+\cdots$$

Para obtener los dígitos usamos la función `digits()`:

```{python}
digits(157,5)
```

*** Sin embargo, dado que queremos "elevar" de $\mathbb{Z}/n\mathbb{Z}$ a $\mathbb{Z}$, 

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

I + O(5^9)
 
sqrt(6 + O(5^20))
sqrt(9 + O(5^20))
sqrt(8 + O(5^20))
```

La última línea de código produce un error. 

#### Orden (Valuation)

El orden p-ádico de $n$, $v_p(n)$,  es tal que  $n = p^{v_p(n)}n'$


```{python}
valuation(400,5)
5^(valuation(400,5))*16


valuation(965,7)
valuation(196/48,7)
valuation(196,7)
valuation(48,7)

valuation(123,7)
valuation(123/48,7)

valuation(180/3,5)

valuation(180*4,5)
valuation(180,5)+valuation(4,5)

valuation(180,5) + valuation(400,5)
```


#### Raíces p-ádicas

Se quieren encontrar las raices del polinomio $x^2+x+6$ `mod` $p$. 

```{python}
raiz = padicappr(x^2+x+6,0+O(2^20))[1]
concat("...",concat([Str(x)|x<-digits(lift(raiz),raiz.p)]))
raiz^2
raiz^2 + raiz + 6
```
Paso a paso:

```{python}
a = 0 + O(2^20)
valuation(a^2 + a + 6,2)
valuation(2*a + 1,2)

b = a  - (a^2 + a + 6)/(2*a+1)
b^2 + b + 6
a = b
b = a  - (a^2 + a + 6)/(2*a+1)
b^2 + b + 6
a = b
b = a  - (a^2 + a + 6)/(2*a+1)
b^2 + b + 6
a = b
b = a  - (a^2 + a + 6)/(2*a+1)
b^2 + b + 6
```



Ahora encontremos $x$ tal que $x^2 - 17 \equiv 1 (\text{mod} 2)$:

```{python}
a = 1 + O(2^20)
valuation(a^2 -17 ,2)
valuation(2*a ,2)

r2 = padicappr(x^2-17,1+O(2^20))
concat("...",concat([Str(x)|x<-digits(lift(r2[1]),2)]))
```

Una raíz es congruente con $1 (\text{mod} 8)$ y la otra es $7 (\text{mod} 8)$


```{python}
factorpadic(x^2 - 17, 2,20)
factorpadic(x^2 + x + 6, 2,20) 
```

### Series de potencias


Sea $$ f(X) = 1 + X + \frac{X^2}{2}+\cdots + \frac{X^n}{n!}+ \cdots,$$ 
$$g(X) = 2X^2 - 2X$$
y $h(X) = f(g(X))$.

```{python}
h(x)=exp(2*x^2-2*x)
hseries=truncate(exp(2*x^2-2*x))

h(1+O(2^20))
subst(hseries,x,1+O(2^20))
```


#### Polinomios generadores $K/\mathbb{Q}_p$ de grado $n$
```{python}
padicfields(3,4)
```

