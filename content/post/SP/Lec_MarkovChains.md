+++
date      = 2020-09-28
lastmod   = 2022-04-03
draft     = true
math      = true
+++


Cadenas de Markov
================

Material taken from **Durrett, R. (2016). Essentials of Stoichastic
Processes. Springer.**

## Definitions and examples

> **Example 1.1** (Gambler’s Ruin). Consider a gambling game in which on
> any turn you win 1 with probability $p$ = 0.4 or lose 1 with
> probability $1 − p$ = 0.6. Suppose further that you adopt the rule
> that you quit playing if your fortune reaches N. Of course, if your
> fortune reaches 0 the casino makes you stop.

We say that $X_n$ is a discrete time **Markov chain** with
**transition matrix** $p_{ij}$ if for any
$j,i, i_{n-1}, \ldots, i_0$

$$
\\begin{aligned}
\\Pr(X\_{n+1}=j \| X\_{n} = i, X\_{n-1} = i\_{n-1},\\ldots, X\_{0} = i\_{0} ) &= \\Pr(X\_{n+1}=j \| X\_{n} = i)\\\\
&=  p\_{ij}\\\\ 
\\end{aligned}
$$

In the case of the gambler’s ruin chain, the transition probability has
$p_{00} = 1$, $p_{NN} = 1$ and

$$p_{i,i+1} = 0.4\qquad p_{i,i-1} = 0.6\qquad \text{si } 0<i<N.$$

``` r
library(pracma)
N = 5
p = 0.4
d = c(1,rep(0,N-1),1)
d1 = c(rep(1-p,N-1),0)
d2 = c(0,rep(p,N-1))
P_gr = diag(d) + Diag(d1, -1) + Diag(d2, 1)
```

``` python
import numpy as np
N = 5
p = 0.4
d = np.zeros(N+1); d[0] = 1; d[N] = 1
d1 = np.full(N,1-p); d1[N-1] = 0
d2 = np.full(N,p); d2[0] = 0
Pgr = np.diag(d1,-1) + np.diag(d) + np.diag(d2, 1)
```

> **Example 1.7** (Repair Chain). A machine has three critical parts
> that are subject to failure, but can function as long as two of these
> parts are working. When two are broken, they are replaced and the
> machine is back to working order the next day. To formulate a Markov
> chain model we declare its state space to be the parts that are broken
> {0, 1, 2, 3, 12, 13, 23}. If we assume that parts 1, 2, and 3 fail
> with probabilities .01, .02, and .04, but no two parts fail on the
> same day, then we arrive at the following transition matrix:

$$
\\begin{array}{cccccccc}
 &\\mathbf{0}&\\mathbf{1}&\\mathbf{2}&\\mathbf{3}&\\mathbf{12}&\\mathbf{13}&\\mathbf{23}\\\\
\\mathbf{0}&.93& .01 & .02 & .04 & 0 & 0 & 0\\\\
\\mathbf{1}& &  &  &  &  &  & \\\\
\\mathbf{2}& &  &  &  &  &  & \\\\
\\mathbf{3}& &  &  &  &  &  & \\\\
\\mathbf{12}&1& 0 & 0 & 0 & 0 & 0 & 0\\\\
\\mathbf{13}&1& 0 & 0 & 0 & 0 & 0 & 0\\\\
\\mathbf{23}&1& 0 & 0 & 0 & 0 & 0 & 0\\\\
\\end{array}$$

> Andrei Andreyevich Markov, the Russian mathematician who introduced
> Markov chains over 100 years ago, first applied them in the analysis
> of the poem Eugene Onegin by Alexander Pushkin. In the first 20,000
> letters of the poem, Markov counted (by hand!) 8,638 vowels and 11,362
> consonants. He also tallied pairs of successive letters. Of the 8,638
> pairs that start with vowels, 1,104 pairs are vowel–vowel. Of the
> 11,362 pairs that start with consonants, 3,827 are
> consonant–consonant. Markov treated the succession of letter types as
> a random sequence. The resulting transition matrix is

$$\\left(
\\begin{array}{cc}
1104/8638& \\\\
& 3827/11362\\\\
\\end{array}
\\right)$$

> Markov showed that the succession of letter types was not an
> independent sequence. For instance, if letter types were independent,
> the probability of two successive consonants would be

$$\\left(\\frac{11362}{20000}\\right)^2 = 0.323$$

whereas from Pushkin’s poem the probability is
$p_{cc} = 0.474$.

## Multistep Transition Probabilities

Our goal in this section is to compute the probability of going $i$ to $j$ in $m > 1$ steps:

$$p_{ij}^m = \Pr(X_{m+n} = j |X_n = i)$$

> **Example 1.4** (Social Mobility). Let *X*<sub>*n*</sub> be a family’s
> social class in the *n*th generation, which we assume is either 1 =
> lower, 2 = middle, or 3 = upper. In our simple version of sociology,
> changes of status are a Markov chain with the following transition
> probability

$$
\\begin{array}{cccc}
 &\\mathbf{1}&\\mathbf{2}&\\mathbf{3}\\\\
\\mathbf{1}&.7& .2 & .1\\\\
\\mathbf{2}& .3& .5 & .2\\\\
\\mathbf{3}& .2& .4 & .4 \\\\
\\end{array}$$

Lets us find
$$\Pr(X_2 = 3, X_1 = 2 | X_0 = 1).$$

$$
\\begin{aligned}
\\Pr(X\_2 = 3 \| X\_0 = 1) &= \\sum\_{i = 1}^3\\Pr(X\_2 = 3, X\_1 = i \| X\_0 = 1)\\\\
&= \\sum\_{i = 1}^3\\Pr(X\_2 = 3\| X\_1 = i, X\_0 = 1)\\Pr(X\_1 = i \| X\_0 = 1)\\\\
&= \\sum\_{i = 1}^3\\Pr(X\_2 = 3\| X\_1 = i)\\Pr(X\_1 = i \| X\_0 = 1)\\\\
&= \\sum\_{i = 1}^3 p\_{i3}p\_{1i}\\\\
&= p\_{\\cdot3}^Tp\_{1\\cdot}
\\end{aligned}
$$
Donde $p_{\cdot3}^T = (p_{13}, p_{23}, p_{33})^T$ y $p_{1\cdot}^T = (p_{11}, p_{12}, p_{13})^T$

**Chapman–Kolmogorov equation**

$$ p_{ij}^{m+n} = \sum_{k}p_{ik}^mp_{kj}^n $$

> Gambler’s Ruin

``` r
P_gr%*%P_gr
```

    ##      [,1] [,2] [,3] [,4] [,5] [,6]
    ## [1,] 1.00 0.00 0.00 0.00 0.00 0.00
    ## [2,] 0.60 0.24 0.00 0.16 0.00 0.00
    ## [3,] 0.36 0.00 0.48 0.00 0.16 0.00
    ## [4,] 0.00 0.36 0.00 0.48 0.00 0.16
    ## [5,] 0.00 0.00 0.36 0.00 0.24 0.40
    ## [6,] 0.00 0.00 0.00 0.00 0.00 1.00

``` python
np.matmul(Pgr,Pgr)
```

> Social Mobility

``` r
P_sm = matrix(c(.7,.2,.1,.3,.5,.2,.2,.4,.4), byrow = T, ncol=3) 
P_sm%*%P_sm
```

    ##      [,1] [,2] [,3]
    ## [1,] 0.57 0.28 0.15
    ## [2,] 0.40 0.39 0.21
    ## [3,] 0.34 0.40 0.26

``` python
np.matmul(Psm,Psm)
```


## Classification of States

Theorem 1.2 (Strong Markov Property). Suppose T is a stopping time. Given that $T = n$ and $X_T = y$, any other information about $X_0,\ldots, X_T$ is irrelevant for predicting the future, and $X_{y+k}$, $k\geq 0$ behaves like the Markov chain with initial state $y$.
