+++
math = true
+++

Material taken from **Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**

## Two-sample tests of hypothesis: independent samples

A city planner in Tampa, Florida wishes to know whether there is a difference in the mean hourly wage rate of plumbers and electricians in central Florida. A financial accountant wishes to know whether the mean rate of return for domestic, U.S., mutual funds is different from the mean rate of return on global mutual funds. In each of these cases, there are two independent populations. In the first case, the plumbers represent one population and the electricians, the other. In the second case, domestic, U.S., mutual funds are one population and global mutual funds, the other.

Let’s assume some information that is not usually available. Suppose that the population of plumbers has a mean of USD 30.00 per hour and a standard deviation of USD 5.00 per hour. The population of electricians has a mean of USD 29.00 and a standard deviation of USD 4.50. Now, from this information it is clear that the two population means are not the same. The plumbers actually earn USD 1.00 per hour more than the electricians. But we cannot expect to uncover this difference each time we sample the two populations.

Suppose we select a random sample of 40 plumbers and a random sample of 35 electricians and compute the mean of each sample. Then, we determine the difference between the sample means. It is this difference between the sample means that holds our interest. If the populations have the same mean, then we would expect the differ- ence between the two sample means to be zero. If there is a difference between the population means, then we expect to find a difference between the sample means.

The following table shows the result of selecting 20 different samples of 40 plumbers and 35 electricians, computing the mean of each sample, and finding the difference between the two sample means. In the first case, the sample of 40 plumbers has a mean of USD 29.80, and for the 35 electricians the mean is USD 28.76. The difference between the sample means is USD 1.04. This process was repeated 19 more times. Observe that in 17 of the 20 cases, the differences are positive because the mean of the plumbers is larger than the mean of the electricians. In two cases, the differences are negative because the mean of the electricians is larger than the mean of the plumbers. In one case, the means are equal.


|  Sample |  Plumbeers    | Electricians     |   Difference   |
|--:|-----:|-----:|-----:|
|  1| 29.80| 28.76|  1.04|
|  2| 30.32| 29.40|  0.92|
|  3| 30.57| 29.94|  0.63|
|  4| 30.04| 28.93|  1.11|
|  5| 30.09| 29.78|  0.31|
|  6| 30.02| 28.66|  1.36|
|  7| 29.60| 29.13|  0.47|
|  8| 29.63| 29.42|  0.21|
|  9| 30.17| 29.29|  0.88|
| 10| 30.81| 29.75|  1.06|
| 11| 30.09| 28.05|  2.04|
| 12| 29.35| 29.07|  0.28|
| 13| 29.42| 28.79|  0.63|
| 14| 29.78| 29.54|  0.24|
| 15| 29.60| 29.60|  0.00|
| 16| 30.60| 30.19|  0.41|
| 17| 30.79| 28.65|  2.14|
| 18| 29.14| 29.95| -0.81|
| 19| 29.91| 28.75|  1.16|
| 20| 28.74| 29.21| -0.47|


Statistical theory shows that when we have independent populations, as in this case, the distribution of the differences has a variance (standard deviation squared) equal to the sum of the two individual variances. This means that we can add the variances of the two sampling distributions.

$$\sigma^2_{\overline{x}_1-\overline{x}_2} = \frac{\sigma^2_1}{n_1} + \frac{\sigma^2_2}{n_2}$$


We can put this equation in a more usable form by taking the square root, so that we have the standard deviation or “standard error” of the distribution of differences. Finally, we standardize the distribution of the differences. The result is the following equation.

$$z = \displaystyle\frac{\overline{x}_1-\overline{x}_2}{\displaystyle\sqrt{\frac{\sigma^2_1}{n_1} + \frac{\sigma^2_2}{n_2}}} $$

The assumptions necessary for using this formula are:
+ The two populations follow normal distributions.
+ The two samples are unrelated, that is, independent.
+ The standard deviations for both populations are known.


> Customers at the FoodTown Supermarket have a choice when paying for their groceries. They may check out and pay using the standard cashier-assisted checkout, or they may use the new Fast Lane procedure. In the standard procedure, a FoodTown employee scans each item and puts it on a short conveyor, where another employee puts it in a bag and then into the grocery cart. In the Fast Lane procedure, the customer scans each item, bags it, and places the bags in the cart him- or her- self. The Fast Lane procedure is designed to reduce the time a customer spends in the checkout line.
> The Fast Lane facility was recently installed at the Byrne Road FoodTown location. The store manager would like to know if the mean checkout time using the standard checkout method is longer than using the Fast Lane. She gathered the following sample information. The time is measured from when the customer enters the line until all his or her bags are in the cart. Hence the time includes both waiting in line and checking out. What is the $p$-value?


Customer Type | Sample Size | Sample Mean | Population Standard Deviation
----|----|----|----
Standard | 50 | 5.50 minutes | 0.40 minute
Fast Lane | 100 |  5.30 minutes | 0.30 minute


$$\begin{aligned}
H_0 &: \mu_s \leq \mu_f\\
H_1 &: \mu_s > \mu_f
\end{aligned}
$$

Take $\alpha = 0.01$


```{r}
z = (5.5-5.3)/sqrt(.4^2/50 + .3^2/100)
# Punto crítico
qnorm(.99)
# p-valor
1 - pnorm(z)
```

## Comparing population means with unknown population standard deviation

In the previous section, we used the standard normal distribution and z as the test statistic to test a hypothesis that two population means from independent populations were equal. The hypothesis tests presumed that the populations were normally distributed and that we knew the population standard deviations. However, in most cases, we do not know the population standard deviations. We can overcome this problem, as we did in the one-sample case in the previous chapter, by substituting the sample standard deviation ($s$) for the population standard deviation ($\sigma$)


### Two-Sample Pooled Test

In this section, we describe another method for comparing the sample means of two independent populations to determine if the sampled populations could reasonably have the same mean. The method described does not require that we know the standard deviations of the populations. This gives us a great deal more flexibility when investigating the difference in sample means. There are two major differences in this test and the previous test described in this chapter.

1. We assume the sampled populations have equal but unknown standard deviations. Because of this assumption, we combine or “pool” the sample standard deviations.
2. We use the $t$ distribution as the test statistic.


The following formula is used to pool the sample standard deviations. Notice that two factors are involved: the number of observations in each sample and the sample standard deviations themselves.


$$S^2_p = \frac{(n_1-1)S^2_1 +(n_2-1)S^2_2}{n_1+n_2-2}$$



