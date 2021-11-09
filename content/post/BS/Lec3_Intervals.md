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


> Suppose an article in your local newspaper reported that the mean time to sell a residential prop- erty in the area is 60 days. You select a random sample of 20 homes sold in the last year and find the mean selling time is 65 days. Based on the sample data, you de- velop a 95% confidence interval for the population mean. You find that the endpoints of the confidence interval are 62 days and 68 days. How do you interpret this result? You can be reasonably confident the population mean is within this range. The value proposed for the population mean, that is, 60 days, is not included in the interval. It is not likely that the population mean is 60 days. The evidence indicates the statement by the local newspaper may not be correct. To put it another way, it seems un- reasonable to obtain the sample you did from a population that had a mean selling time of 60 days.

> The manager of the Inlet Square Mall, near Ft. Myers, Florida, wants to estimate the mean amount spent per shopping visit by customers. A sample of 20 customers reveals the following amounts (in dollars) spent.

> 48.16 37.92 49.17 42.22 52.64 61.46 46.82 48.59 51.35 51.45 50.82 52.68 23.78 46.94 58.84 41.86 54.86 61.83 61.69 43.88

> What is the best estimate of the population mean? Determine a 95% confidence interval. Interpret the result. Would it be reasonable to conclude that the population mean is $50? What about $60?


## Confidence intervals for the population proportion


We now want to consider situations such as the following:
+ The career services director at Southern Technical Institute reports that 80% of its graduates enter the job market in a position related to their field of study.
+ A company representative claims that 45% of Burger King sales are made at the drive-through window.
+ A survey of homes in the Chicago area indicated that 85% of the new con- struction had central air conditioning.
+ A recent survey of married men between the ages of 35 and 50 found that 63% felt that both partners should earn a living.

In these cases, an observation is classified into one of two mutually exclusive groups. For example, a graduate of Southern Tech either entered the job market in a position related to his or her field of study or not. A particular Burger King customer either made a purchase at the drive-through window or did not make a purchase at the drive-through window. We can talk about the groups in terms of proportions.


**PROPORTION:** The fraction, ratio, or percent indicating the part of the sample or the population having a particular trait of interest.

The population proportion is identified by $\pi$. Therefore, $\pi$ refers to the percent of successes in the population. Recall from a previous course that $\pi$ is the proportion of “successes” in a binomial distribution.

To develop a confidence interval for a proportion, we need to meet two requirements:

1. The sample data are the number of successes in $n$ trials.
2. There are only two possible outcomes. (We usually label one of the outcomes a “success” and the other a “failure.”)
3. The probability of a success remains the same from one trial to the next.
4. The trials are independent. This means the outcome on one trial does not affect the outcome on another.
5. The values $n\pi$ and $n(1-\pi)$ should both be greater than or equal to 5. This allows us to invoke the central limit theorem and employ the standard normal distribution, that is, $z$, to complete a confidence interval.

Developing a point estimate for a population proportion and a confidence interval for a population proportion is similar to doing so for a mean. 

> John Gail is running for Congress from the third district of Nebraska. From a random sample of 100 voters in the district, 60 indicate they plan to vote for him in the upcoming election. The sample proportion is .60, but the population proportion is unknown. That is, we do not know what proportion of voters in the population will vote for Mr. Gail. The sample value, .60, is the best estimate we have of the unknown population parameter. So we let p, which is .60, be an estimate of $\pi$, which is not known.

To develop a confidence interval for a population proportion, we use:

$$p \pm z\sqrt{\frac{p(1-p)}{n}.$$


> The union representing the Bottle Blowers of America (BBA) is considering a pro- posal to merge with the Teamsters Union. According to BBA union bylaws, at least three-fourths of the union membership must approve any merger. A random sam- ple of 2,000 current BBA members reveals 1,600 plan to vote for the merger proposal. What is the estimate of the population proportion? Develop a 95% confidence interval for the population proportion. Basing your decision on this sample information, can you conclude that the necessary proportion of BBA members favor the merger? Why?





