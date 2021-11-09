+++
math = true
+++

Material taken from **Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**


## Point estimation of the sample mean

A point estimate is a single statistic used to estimate a population parameter. The mean of this sample is a point estimate of the population mean.

**POINT ESTIMATE:** The statistic, computed from sample information, that estimates a population parameter.

> Litchfield Home Builders Inc. builds homes in the southeastern region of the United States. One of the major concerns of new buyers is the date when the home will be completed. Recently, Litchfield has been telling customers, “Your home will be completed 45 working days from the date we begin installing drywall.” The customer relations department at Litchfield wishes to compare this pledge with recent experience. A sample of 50 homes completed this year revealed that the point estimate of the population mean is 46.7 working days from the start of drywall to the completion of the home. Is it reasonable to conclude that the population mean is still 45 days and that the difference between the sample mean (46.7 days) and the proposed population mean (45 days) is sampling error? In other words, is the sample mean significantly different from the population mean?


## Confidence intervals for the population mean


While we expect the point estimate to be close to the population parameter, we would like to measure how close it really is. A confidence interval serves this purpose. For example, we estimate the mean yearly income for construction workers in the New York–New Jersey area is $85,000. The range of this estimate might be from $81,000 to $89,000. We can describe how confident we are that the population parameter is in the interval. We might say, for instance, that we are 90% confident that the mean yearly income of construction workers in the New York–New Jersey area is between $81,000 and $89,000.


**CONFIDENCE INTERVAL:** A range of values constructed from sample data so that the population parameter is likely to occur within that range at a specified probability. The specified probability is called the level of confidence.


The $t$ distribution is a continuous probability distribution, with many similar characteristics to the $z$ distribution. Consider the following statistic:

$$t = \frac{\overline{X} - \mu}{s/\sqrt{n}},$$

where $s$, the sample standard deviation, is used to estimate $\sigma$, the population standard deviation.

```{r}
xs = seq(-3,3,length=101)
plot(xs, dnorm(xs), type="l", xlab = "x", ylab = "Density")
lines(xs, dt(xs, 2), col = 2)
legend(1,.4,c("Normal(0,1)","t"), col = 1:2, lty=1)
```

Note particularly that the $t$ distribution is flatter, more spread out, than the standard normal distribution. This is because the standard deviation of the $t$ distribution is larger than that of the standard normal distribution.

Confidence interval for the population mean, $\sigma$ inknonw:

$$ \overline{X} \pm t_{df}\frac{s}{\sqrt{n}}.$$


To determine a confidence interval for the population mean with an unknown population standard deviation, we:
1. Assume the sampled population is either normal or approximately normal. This assumption may be questionable for small sample sizes, and becomes more valid with larger sample sizes.
2. Estimate the population standard deviation ($\sigma$) with the sample standard deviation ($s$).
3. Use the $t$ distribution rather than the $z$ distribution.


> A tire manufacturer wishes to investigate the tread life of its tires. A sample of 10 tires driven 50,000 miles revealed a sample mean of 0.32 inch of tread remaining with a standard deviation of 0.09 inch. Construct a 95% confidence interval for the population mean. Would it be reasonable for the manufacturer to con- clude that after 50,000 miles the population mean amount of tread remaining is 0.30 inch?






