+++
math = true
+++

Material taken from **Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**


## Testing a Hypothesis of Equal Population Variances

> A health services corporation manages two hospitals in Knoxville, Tennessee: St. Mary’s North and St. Mary’s South. In each hospital, the mean waiting time in the Emergency Department is 42 minutes. The hospital administrator believes that the St. Mary’s North Emergency Department has more variation in waiting time than St. Mary’s South.

To compare two population variances, we first state the null hypothesis. The null hypothesis is that the variance of one normal population, $\sigma_1^2$ , equals the variance of another normal population, $\sigma_2^2$. The alternate hypothesis is that the variances differ. In this instance, the null hypothesis and the alternate hypothesis are:

$$H_0: \sigma_1^2 = \sigma_2^2$$
$$H_1: \sigma_1^2 \neq \sigma_2^2$$

To conduct the test, we select a random sample of observations, $n_1$, from one population and a random sample of observations, $n_2$, from the second population. The test statistic is defined as follows.

$$F = \frac{s_1^2}{s_2^2}$$

If the null hypothesis is true, the test statistic follows the $F$ distribution with $n_1-1$ and $n_2-1$ degrees of freedom. 

> Lammers Limos offers limousine service from Government Center in downtown Toledo, Ohio, to Metro Airport in Detroit. Sean Lammers, president of the company, is considering two routes. One is via U.S. 25 and the other via I-75. He wants to study the time it takes to drive to the airport using each route and then compare the results. He collected the following sample data, which is reported in minutes. Using the .10 significance level, is there a difference in the variation in the driving times for the two routes?

U.S. Route 25 | Interstate 75
-----|------
    52 | 59
    67 | 60
    56 | 61
    45 | 51
    70 | 56
    54 | 63
    64 | 57
    -  | 65

## Comparing two population variances


