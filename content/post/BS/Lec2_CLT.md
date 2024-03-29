+++
date      = 2020-09-28
lastmod   = 2022-04-03
draft     = true
math      = true
+++

**Material taken from Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**


Using the information collected in class, assume we have a population with $N = 9$ female students whose heights are:

156, 149, 161, 150, 159, 166, 155, 162, 169

We are going to draw samples of size $n = 4$.


Sampling Error
================

Samples are used to estimate population characteristics. We can therefore expect a differ- ence between a sample statistic and its corresponding population parameter. This difference is called sampling error.

**Sampling error.** The difference between a sample statistic and its corresponding population parameter.

**Example.** 

$$e = \mu - \bar{x} $$

```{r}
alturas = c(156,149,161,150,159,166,155,162,169)
mu = mean(alturas)               # true mean
muestra0 = sample(alturas, 4)
error = mu - mean(muestra0)

# Another sample
muestra0 = sample(alturas, 4)
error = mu - mean(muestra0)
```

Sampling distribution of the sample mean
=======================================

**Samping distribution of the sample mean** A probability distribution of all possible sample means of a given sample size.


Consider the number of possible samples of size 4:

$${9 \choose 4} = 126.$$

We are going to obtain all possible samples "manually" and using the library `gtools`

```{r}
muestras = matrix(NA,ncol = 4, nrow =126)
m = 1
for( i in 1:6){
  for(j in (i+1):7){
    for(k in (j+1):8){
      for(l in (k+1):9){
         muestras[m,] = alturas[c(i,j,k,l)]
         m = m + 1
      }
    }
  }
}

library(gtools)
combinaciones = combinations(9,4,alturas)
```

To compute the mean for each sample, we use the `apply()` function:

```{r}
medias = apply(combinaciones, 1, mean)
# Sample's means histogram
hist(medias, prob = TRUE)
medias.df = data.frame(medias = medias)

# We could use the ggplo2 library
library(ggplot2)
ggplot(medias.df, aes(x = medias)) +
  geom_histogram(binwidth = .5, fill = "lightblue")
```

Note that `mean(medias)` is equal to `mean(alturas)`.


**CENTRAL LIMIT THEOREM.** If all samples of a particular size are selected from any population, the sampling distribution of the sample mean is approximately a normal distribution. This approximation improves with larger samples.

$$\overline{X} \sim \text{N}(\mu, \sigma^2/n).$$

We refer to $\sigma/\sqrt{n}$ as the standard error of the mean. Its longer name is actually the standard deviation of the sampling distribution of the sample mean.


In this section, we also came to other important conclusions.
1. The mean of the distribution of sample means will be exactly equal to the population mean if we are able to select all possible samples of the same size from a given population. That is:
$$\mu = \mu_{\overline{X}}$$
Even if we do not select all samples, we can expect the mean of the distribution of sample means to be close to the population mean.
2. There will be less dispersion in the sampling distribution of the sample mean than in the population. If the standard deviation of the population is $\sigma$, the standard deviation of the distribution of sample means is $\sigma/\sqrt{n}$. Note that when we increase the size of the sample, the standard error of the mean decreases.
