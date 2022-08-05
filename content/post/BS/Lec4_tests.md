+++
date      = 2020-09-28
lastmod   = 2022-04-03
draft     = true
math      = true
+++

Material taken from **Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**

## Hipothesis testing


Hypothesis testing starts with a statement, or assumption, about a population parameter—such as the population mean. This statement is referred to as a hypothesis.

A hypothesis might be that the mean monthly commission of sales associates in retail electronics stores, such as hhgregg, is USD 2,000. We cannot contact all hhgregg sales associates to determine that the mean is USD 2,000. The cost of locating and inter- viewing every hhgregg electronics sales associate in the United States would be exorbitant. To test the validity of the hypothesis ($\mu$ = USD 2,000), we must select a sample from the population of all hhgregg electronics sales associates, calculate sample statistics, and based on certain decision rules reject or fail to reject the hypothesis. A sample mean of USD 1,000 per month is much less than USD 2,000 per month and we would most likely reject the hypothesis. However, suppose the sample mean is USD 1,995. Can we attribute the USD 5 difference between USD 1,995 and USD 2,000 to sampling error? Or is this difference of USD 5 statistically significant?

**HYPOTHESIS TESTING** A procedure based on sample evidence and probability theory to determine whether the hypothesis is a reasonable statement.

## Six-stop approach for testing a hypothesis

+ **Step 1**: State the Null Hypothesis ($H_0$) and the Alternate Hypothesis ($H_1$)
+ **Step 2**: Select a Level of Significance
+ **Step 3**: Select the Test Statistic
+ **Step 4**: Formulate the Decision Rule
+ **Step 5**: Make a Decision
+ **Step 6**: Interpret the Result



### Step 1. State the Null Hypothesis ($H_0$) and the Alternate Hypothesis ($H_1$)

The first step is to state the hypothesis being tested. It is called the null hypothesis, designated $H_0$, and read “H sub zero.” 

Often, the null hypothesis begins by stating, “There is no significant difference between...” or “The mean impact strength of the glass is not significantly different from...”. When we select a sample from a population, the sample statistic is usually numerically different from the hypothesized population parameter. As an illustration, suppose the hypothesized impact strength of a glass plate is 70 psi, and the mean impact strength of a sample of 12 glass plates is 69.5 psi. We must make a decision about the difference of 0.5 psi. Is it a true difference, that is, a significant difference, or is the difference between the sample statistic (69.5) and the hypothesized population param- eter (70.0) due to chance (sampling)? 

**NULL HYPOTHESIS** A statement about the value of a population parameter developed for the purpose of testing numerical evidence.

The alternate hypothesis describes what you will conclude if you reject the null hypothesis. It is written $H_1$ and is read “H sub one.” It is also referred to as the research hypothesis. The alternate hypothesis is **retained** if the sample data provide us with enough statistical evidence that the null hypothesis is false.

**ALTERNATE HYPOTHESIS** A statement that is accepted if the sample data provide sufficient evidence that the null hypothesis is false.


> A recent article indicated the mean age of U.S. commercial aircraft is 15 years. To conduct a statistical test regarding this statement, the first step is to determine the null and the alternate hypotheses. The null hypothesis represents the current or reported condition. It is written $H_0: \mu = 15$. The alternate hypothesis is that the statement is not true, that is, $H_1: \mu\neq 15$. It is important to remember that no matter how the problem is stated, the null hypothesis will always contain the equal sign. The equal sign (=) will never appear in the alternate hypothesis. Why? Because the null hypothesis is the statement being tested, and we need a specific value to include in our calculations. We turn to the alternate hypothesis only if the data suggest the null hypothesis is untrue.

### **Step 2**: Select a Level of Significance

**LEVEL OF SIGNIFICANCE $\alpha$** The probability of rejecting the null hypothesis when it is true.

There is no one level of significance that is applied to all tests. A decision is made to use the .05 level (often stated as the 5% level), the .01 level, the .10 level, or any other level between 0 and 1. Traditionally, the .05 level is selected for consumer research projects, .01 for quality assurance, and .10 for political polling.


> Suppose a firm manufacturing personal computers uses a large number of printed circuit boards. Suppliers bid on the boards, and the one with the lowest bid is awarded a sizable contract. Suppose the contract specifies that the computer manufacturer’s quality-assurance department will randomly sample all incoming shipments of circuit boards. If more than 6% of the boards sampled are substandard, the shipment will be rejected. The null hypothesis is that the incoming shipment of boards meets the quality standards of the contract and contains 6% or less defective boards. The alternate hypothesis is that more than 6% of the boards are defective. A shipment of 4,000 circuit boards was received from Allied Electronics, and the quality assurance department selected a random sample of 50 circuit boards for testing. Of the 50 circuit boards sampled, 4 boards, or 8%, were substandard. The shipment was rejected because it exceeded the maximum of 6% substandard printed circuit boards. If the shipment was actually substandard, then the decision to return the boards to the supplier was correct.
> However, because of sampling error, there is a small probability of an incorrect decision. Suppose there were only 40, or 4%, defective boards in the shipment (well under the 6% threshold) and 4 of these 40 were randomly selected in the sample of 50. The sample evidence indicates that the percentage of defective boards is 8% (4 out of 50 is 8%) so we reject the shipment. But, in fact, of the 4,000 boards, there are only 40 defective units. The true defect rate is 1.00%. In this instance our sample evidence estimates 8% defective but there is only 1% defective in the population. Based on the sample evi- dence, an incorrect decision was made. In terms of hypothesis testing, we rejected the null hypothesis when we should have failed to reject the null hypothesis. By rejecting a true null hypothesis, we committed a Type I error. The probability of committing a Type I error is represented by $\alpha$.



**TYPE I ERROR** Rejecting the null hypothesis, $H_0$, when it is true.

**TYPE II ERROR** Not rejecting the null hypothesis when it is false.


### **Step 3**: Select the Test Statistic

**TEST STATISTIC** A value, determined from sample information, used to determine whether to reject the null hypothesis.


### **Step 4**: Formulate the Decision Rule


A decision rule is a statement of the specific conditions under which the null hypothesis is rejected and the conditions under which it is not rejected. The region or area of rejection defines the location of all those values that are so large or so small that the probability of their occurrence under a true null hypothesis is rather remote.

**CRITICAL VALUE** The dividing point between the region where the null hypothesis is rejected and the region where it is not rejected.

### **Step 5**: Make a Decision

The fifth step in hypothesis testing is to compute the value of the test statistic, compare its value to the critical value, and make a decision to reject or not to reject the null hypothesis. 


### **Step 6**: Interpret the Result

The final step in the hypothesis testing procedure is to interpret the results. The process does not end with the value of a sample statistic or the decision to reject or not reject the null hypothesis. What can we say or report based on the results of the statistical test?


##  One-tailed and two-tailed hypothesis tests


> Suppose that the packaging department at General Foods Corporation is concerned that some boxes of Grape Nuts are significantly overweight. The cereal is packaged in 453-gram boxes, so the null hypothesis is $H_0: \mu \leq 453$. This is read, “the population mean ($\mu$) is equal to or less than 453.” The alternate hypothesis is, therefore, $H_1: \mu > 453$. This is read, “$\mu$ is greater than 453.”


> consider the problem of automobile manufacturers, large automobile leasing companies, and other organizations that purchase large quantities of tires. They want the tires to average, say, 60,000 miles of wear under normal usage. They will, therefore, reject a shipment of tires if tests reveal that the mean life of the tires is significantly below 60,000 miles. They gladly accept a shipment if the mean life is greater than 60,000 miles! They are not concerned with this possibility, however. They are concerned only if they have sample evidence to conclude that the tires will average less than 60,000 miles of useful life. Thus, the test is set up to satisfy the concern of the automobile manufacturers that the mean life of the tires is not less than 60,000 miles. This statement appears in the null hypothesis. The null and alternate hypotheses in this case are written $H_0: \mu \geq 60,000$ and $H_1: \mu <60,000$.


##  Hypothesis testing for a population mean

$$t = \frac{\overline{X} - \mu }{s/\sqrt{n} }$$

> The McFarland Insurance Company Claims Department reports the mean cost to process a claim is $60. An industry comparison showed this amount to be larger than most other insurance companies, so the company instituted cost-cutting measures. To evaluate the effect of the cost-cutting measures, the supervisor of the Claims Department selected a random sample of 26 claims processed last month and recorded the cost to process each claim. The sample information is reported below.
>  45 49 62 40 43 61 48 53 67 63 78 64 48 54 51 56 63 69 58 51 58 59 56 57 38 76
> At the .01 significance level, is it reasonable to conclude that the mean cost to process a claim is now less than USD 60?



> The Myrtle Beach International Airport provides a cell phone parking lot where people can wait for a message to pick up arriving passengers. To decide if the cell phone lot has enough parking places, the manager of airport parking needs to know if the mean time in the lot is more than 15 minutes. A sample of 12 recent customers showed they were in the lot the following lengths of time, in minutes.
>30 24 28 22 14 2 39 23 23 28 12 31
>At the .05 significance level, is it reasonable to conclude that the mean time in the lot is more than 15 minutes?


**$p$-VALUE** The probability of observing a sample value as extreme as, or more extreme than, the value observed, given that the null hypothesis is true.

## Type II Error


In a hypothesis-testing situation there is also the possibility that a null hypothesis is not rejected when it is actually false. This is called a Type II error.

> Western Wire Products purchases steel bars to make cotter pins. Past experience indicates that the mean tensile strength of all incoming shipments is 10,000 psi and that the standard deviation, σ, is 400 psi. To monitor the quality of the cotter pins, samples of 100 pins are randomly selected and tested for their strength. In our hypothesis testing procedure the hypotheses are:

$$H_0: \mu = 10,000 $$
$$H_1: \mu \neq 10,000 $$

> To determine if a shipment of steel bars meets the quality standard, Western Wire Products set up a rule for the quality-control inspector to follow: “Take a sample of 100 steel bars. Test each of the bars for tensile strength. Using a .05 significance level, accept the shipment if the sample mean ($\overline{x}$) strength falls between 9,922 psi and 10,078 psi.” These values are the critical values for the hypothesis test. If the sample mean is more than 10,078 or less than 9,922, the hypothesis is rejected and we conclude that the shipment does not meet the quality standard.

> Suppose that the result of testing 100 bars results in a sample mean of 9,900 psi. From the quality standards we know that 9,922 psi is used to reject the null hypothesis. Any sample mean greater than 9,922 and less than 10,078 is accepted. If the distribution is really centered on 9,900 psi, it is possible to find sample means more than 9,922, and we would fail to reject the null hypothesis, $\mu$ = 10,000.

