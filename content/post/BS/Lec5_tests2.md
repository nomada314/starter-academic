+++
math = true
+++

Material taken from **Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**

## Two-sample tests of hypothesis: independent samples

A city planner in Tampa, Florida wishes to know whether there is a difference in the mean hourly wage rate of plumbers and electricians in central Florida. A financial accountant wishes to know whether the mean rate of return for domestic, U.S., mutual funds is different from the mean rate of return on global mutual funds. In each of these cases, there are two independent populations. In the first case, the plumbers represent one population and the electricians, the other. In the second case, domestic, U.S., mutual funds are one population and global mutual funds, the other.

Let’s assume some information that is not usually available. Suppose that the population of plumbers has a mean of USD 30.00 per hour and a standard deviation of USD 5.00 per hour. The population of electricians has a mean of USD 29.00 and a standard deviation of USD 4.50. Now, from this information it is clear that the two population means are not the same. The plumbers actually earn USD 1.00 per hour more than the electricians. But we cannot expect to uncover this difference each time we sample the two populations.

Suppose we select a random sample of 40 plumbers and a random sample of 35 electricians and compute the mean of each sample. Then, we determine the difference between the sample means. It is this difference between the sample means that holds our interest. If the populations have the same mean, then we would expect the differ- ence between the two sample means to be zero. If there is a difference between the population means, then we expect to find a difference between the sample means.

The following table shows the result of selecting 20 different samples of 40 plumbers and 35 electricians, computing the mean of each sample, and finding the difference between the two sample means. In the first case, the sample of 40 plumbers has a mean of $29.80, and for the 35 electricians the mean is $28.76. The difference between the sample means is $1.04. This process was repeated 19 more times. Observe that in 17 of the 20 cases, the differences are positive because the mean of the plumb- ers is larger than the mean of the electricians. In two cases, the differences are negative because the mean of the electricians is larger than the mean of the plumbers. In one case, the means are equal.


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




