+++
math = true
+++

Material taken from **Lind, D. A., Marchal, W. G., & Wathen, S. A. (2017). Statistical techniques in business & economics. McGraw-Hill Education.**

## Hipothesis testing


Hypothesis testing starts with a statement, or assumption, about a population parameter—such as the population mean. This statement is referred to as a hypothesis.

A hypothesis might be that the mean monthly commission of sales associates in retail electronics stores, such as hhgregg, is USD 2,000. We cannot contact all hhgregg sales associates to determine that the mean is USD 2,000. The cost of locating and inter- viewing every hhgregg electronics sales associate in the United States would be exorbitant. To test the validity of the hypothesis ($\mu$ = USD 2,000), we must select a sample from the population of all hhgregg electronics sales associates, calculate sample statistics, and based on certain decision rules reject or fail to reject the hypothesis. A sample mean of USD 1,000 per month is much less than USD 2,000 per month and we would most likely reject the hypothesis. However, suppose the sample mean is USD 1,995. Can we attribute the $5 difference between USD 1,995 and USD 2,000 to sampling error? Or is this difference of $5 statistically significant?

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







