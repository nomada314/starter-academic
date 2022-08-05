+++
date      = 2020-09-28
lastmod   = 2022-04-03
draft     = true
math      = true
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


```{r}
R25 = c(52,67,56,45,70,54,64)
I75 = c(59,60,61,51,56,63,57,65)
Fc = var(R25)/var(I75)
# Critical values
qf(c(.05,.95),6,7)

# p-value
1-pf(Fc,6,7) + pf(1/Fc,7,6)

# using var.test
var.test(R25,I75)
```

## ANOVA: Analysis of variance

The ANOVA to test the equality of three or more population means requires that three assumptions are true:

1. The populations follow the normal distribution.
2. The populations have equal standard deviations ($\sigma$).
3. The populations are independent.

Suppose we have four different methods (A, B, C, and D) of training new recruits to be firefighters. We randomly assign each of the 40 recruits in this year’s class to one of the four methods. At the end of the training program, we administer a test to measure understanding of firefighting techniques to the four groups. The question is: Is there a difference in the mean test scores among the four groups? An answer to this
question will allow us to compare the four training methods.

Using the $t$ distribution to compare the four population means, we would have to conduct six different $t$ tests. That is, we would need to compare the mean scores for the four methods as follows: A versus B, A versus C, A versus D, B versus C, B versus D, and C versus D. For each t test, suppose we choose an $\alpha= .05$. Therefore, the probability of a Type I error, rejecting the null when it is true, is .05. The complement is the probability of .95 that we do not reject the null when it is true. Because we conduct six separate (independent) tests, the probability that all six tests result in correct decisions is:

$$\Pr(\text{all correct}) = 0.95^6 = 0.735 $$

To find the probability of at least one error due to sampling, we subtract this result from 1. Thus, the probability of at least one incorrect decision due to sampling is 1 − .735 = .265. 

To summarize, if we conduct six independent tests using the t distribution, the likelihood of rejecting a true null hypothesis because of sampling error is an unsatisfactory .265. The ANOVA technique allows us to compare population means simultane- ously at a selected significance level. It avoids the buildup of Type I error associated with testing many hypotheses.

