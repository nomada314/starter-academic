+++
date      = 2020-09-28
lastmod   = 2022-04-03
draft     = false
math      = true
+++

Material taken from **Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**


## Point estimation of the sample mean

A point estimate is a single statistic used to estimate a population parameter. The mean of this sample is a point estimate of the population mean.

**POINT ESTIMATE:** The statistic, computed from sample information, that estimates a population parameter.

> Litchfield Home Builders Inc. builds homes in the southeastern region of the United States. One of the major concerns of new buyers is the date when the home will be completed. Recently, Litchfield has been telling customers, “Your home will be completed 45 working days from the date we begin installing drywall.” The customer relations department at Litchfield wishes to compare this pledge with recent experience. A sample of 50 homes completed this year revealed that the point estimate of the population mean is 46.7 working days from the start of drywall to the completion of the home. Is it reasonable to conclude that the population mean is still 45 days and that the difference between the sample mean (46.7 days) and the proposed population mean (45 days) is sampling error? In other words, is the sample mean significantly different from the population mean?


## Confidence intervals for the population mean


While we expect the point estimate to be close to the population parameter, we would like to measure how close it really is. A confidence interval serves this purpose. For example, we estimate the mean yearly income for construction workers in the New York–New Jersey area is USD 85,000. The range of this estimate might be from USD 81,000 to USD 89,000. We can describe how confident we are that the population parameter is in the interval. We might say, for instance, that we are 90% confident that the mean yearly income of construction workers in the New York–New Jersey area is between USD 81,000 and USD 89,000.


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

> What is the best estimate of the population mean? Determine a 95% confidence interval. Interpret the result. Would it be reasonable to conclude that the population mean is USD 50? What about USD 60?


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

$$p \pm z\sqrt{\frac{p(1-p)}{n}}.$$


> The union representing the Bottle Blowers of America (BBA) is considering a pro- posal to merge with the Teamsters Union. According to BBA union bylaws, at least three-fourths of the union membership must approve any merger. A random sam- ple of 2,000 current BBA members reveals 1,600 plan to vote for the merger proposal. What is the estimate of the population proportion? Develop a 95% confidence interval for the population proportion. Basing your decision on this sample information, can you conclude that the necessary proportion of BBA members favor the merger? Why?



> The results of many surveys include confidence intervals. For example, a recent survey of 800 TV viewers in Toledo, Ohio, found 44% watched the evening news on the local CBS affiliate. The article also reported a margin of error of 3.4%. The margin of error is actually the amount that is added and subtracted from the point estimate to find the endpoints of a confidence interval. For a 95% level of confidence, the margin of error is:

$$z\sqrt{\frac{p(1-p)}{n}} $$


The estimate of the proportion of all TV viewers in Toledo, Ohio who watch the local news on CBS is between (.44 − .034) and (.44 + .034) or 40.6%
and 47.4%.


## Choosing an appropiate sample size

When working with confidence intervals, one important variable is sample size. However, in practice, sample size is not a variable. It is a decision we make so that our estimate of a population parameter is a good one. Our decision is based on three variables:

1. The margin of error the researcher will tolerate.
2. The level of confidence desired, for example, 95%.
3. The variation or dispersion of the population being studied.


The first variable is the *margin of error*. It is designated as $E$ and is the amount that is added and subtracted to the sample mean (or sample proportion) to determine the endpoints of the confidence interval. 

> In a study of wages, we may decide that we want to estimate the mean wage of the population with a margin of error of plus or minus \$1,000.
> In an opinion poll, we may decide that we want to estimate the population proportion with a margin of error of plus or minus 3.5%. 

The margin of error is the amount of error we are willing to tolerate in estimating a population parameter. A small margin of error will require a larger sample and more money and time to collect the sample. A larger margin of error will permit a smaller sample and result in a wider confidence interval.


The second choice is the *level of confidence*. In working with confidence intervals, we logically choose relatively high levels of confidence such as 95% and 99%. To compute the sample size, we need the z-statistic that corresponds to the chosen level of confidence. The 95% level of confidence corresponds to a z value of 1.96, and a 90% level of confidence corresponds to a z value of 1.645. Notice that larger sample sizes (and more time and money to collect the sample) correspond with higher levels of confidence. Also, notice that we use a z-statistic.


he third choice to determine the sample size is the *population standard deviation*. If the population is widely dispersed, a large sample is required to get a good estimate. On the other hand, if the population is concentrated (homogeneous), the required sample size to get a good estimate will be smaller. Often, we do not know the population standard deviation. Here are three suggestions to estimate the population standard deviation.

1. **Conduct a pilot study**. This is the most common method. Suppose we want an estimate of the number of hours per week worked by students enrolled in the College of Business at the University of Texas. To test the validity of our questionnaire, we use it on a small sample of students. From this small sample, we compute the standard deviation of the number of hours worked and use this value as the population standard deviation.
2. **Use a comparable study**. Use this approach when there is an estimate of the standard deviation from another study. Suppose we want to estimate the number of hours worked per week by refuse workers. Information from certain state or federal agencies that regularly study the workforce may provide a reliable value to use for the population standard deviation.
5. **Use a range-based approach**. To use this approach, we need to know or have an estimate of the largest and smallest values in the population. Recall from Chapter 3, the Empirical Rule states that virtually all the observations could be expected to be within plus or minus 3 standard deviations of the mean, assuming that the distribution follows the normal distribution. Thus, the distance between the largest and the smallest values is 6 standard deviations. We can estimate the standard deviation as one-sixth of the range. For example, the director of operations at University Bank wants to estimate the number of ATM transactions per month made by college stu- dents. She believes that the distribution of ATM transactions follows the normal distribution. The minimum and maximum of ATM transactions per month are 2 and 50, so the range is 48, found by (50 − 2). Then the estimated value of the population standard deviation would be eight ATM transactions per month, 48/6.



Sample size for estimating the population mean

$$n = \left(\frac{z\sigma}{E}\right)^2.$$

> A student in public administration wants to estimate the mean monthly earnings of city council members in large cities. She can tolerate a margin of error of USD 100 in estimating the mean. She would also prefer to report the interval estimate with a 95% level of confidence. The student found a report by the Department of Labor that reported a standard deviation of USD 1,000. What is the required sample size?

Sample size for estimating the population proportion

$$n = \pi(1-\pi)\left(\frac{z}{E}\right)^2.$$

> The student in the previous example also wants to estimate the proportion of cities that have private refuse collectors. The student wants to estimate the population proportion with a margin of error of .10, prefers a level of confidence of 90%, and has no estimate for the population proportion. What is the required sample size?


## Finite-population correction factor

The populations we have sampled so far have been very large or infinite. What if the sampled population is not very large? We need to make some adjustments in the way we compute the standard error of the sample means and the standard error of the sample proportions.

For a finite population, where the total number of objects or individuals is N and the number of objects or individuals in the sample is n, we need to adjust the standard errors in the confidence interval formulas.  This adjustment is called the finite-population correction factor. It is often shortened to FPC and is:


$$\text{FPC}= \sqrt{\frac{N-n}{n-1}}$$

So if we wished to develop a confidence interval for the mean from a finite population and the population standard deviation was unknown, we would use

$$ \overline{X} \pm t_{df}\frac{s}{\sqrt{n}}\sqrt{\frac{N-n}{N-1}}.$$


> There are 250 families residing in Scandia, Pennsylvania. A random sample of 40 of these families revealed the mean annual church contribution was \$450 and the standard deviation of this was USD 75.
1. What is the population mean? What is the best estimate of the population mean?
2. Develop a 90% confidence interval for the population mean. What are the end-points of the confidence interval?
3. Using the confidence interval, explain why the population mean could be USD 445. Could the population mean be USD 425? Why?
