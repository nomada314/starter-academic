+++
math = true
+++

**Material taken from Lind, D. A., Marchal, W. G., & Wathen, S. A.
(2017). Statistical techniques in business & economics. McGraw-Hill
Education.**

Sampling Error
================

Samples are used to estimate population characteristics. We can therefore expect a differ- ence between a sample statistic and its corresponding population parameter. This difference is called sampling error.

**SAMPLING ERROR.** The difference between a sample statistic and its corresponding population parameter.

**Ejemplo.** 

$$e = \mu - \bar{x} $$

```{r}
# Asuma que la media población  es 7 y la varianza es 1.
mu = 7
muestra = rnorm(10,mu,1)
error = mu - mean(muestra)
```



Sampling distribution of the sample mean
=======================================


SAMPLING DISTRIBUTION OF THE SAMPLE MEAN A probability distribution of
all possible sample means of a given sample size.
