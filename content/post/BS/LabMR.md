+++
date      = 2022-08-05
lastmod   = 2022-08-05
draft     = true
math      = true
+++

The sales director for an industrial supplies firm has collected information describing the performance and personal characteristics of 80 members of her sales force. The data in file [Performance.txt](https://alexrojas.netlify.app/Data/Lectures/Performance.txt) include the percent of sales quota the salesperson achieved last year, age, number of years with the firm, and personal appearance (very neat, about average, or a little sloppy). In the data file, a very neat person is coded as `Appearance = 0`, a person of average neatness is coded as `Appearance = 2`, and a sloppy person  is coded as `Appearance = 1`.  

1. With percentage of sales quota as the response, perform a linear regression using the other variables as predictors.  Write down your fitted model and test the overall fit of the regression (You only need to write the hypotheses, the test statistic and  your decision).
2. Find a 95% confidence interval for $\beta_{\texttt{Age} }$ using the model in numeral 1.
3. Assume that a junior salesman is 40 years old and has one year of experience. Based on the model fitted in part (a), we know that the expected percentage of his sales quota is 46.75\%.  Is he a sloppy person? Make sure you show your work. 
4. Assume that a salesman is 50 years old and has ten years of experience. Based on the model fitted in part (a), what is the expected maximum and expected minimum for the mean percentage of sales quota for this salesman? 
5. The sales director thinks that there is an interaction between `Appearance` and the other predictors (`Age` and `YrsFirm`).  Write down the model based on the sales director's believe and test whether or not there is an interaction between `YrsFirm` and  `Appearance`. <!--That is, assume that your full model includes the interactions between `Appearance` and the other predictors `Age` and `YrsFirm` and your reduced model includes the interaction between `Appearance`  and `Age` but excludes the  interaction between `Appearance`  and `YrsFirm`. State the hypotheses to be tested, your test statistic, its critical value, your decision and your conclusion. -->
6. Using the selected model in numeral 5, write down the estimated equation for a very neat person.
7. Draw the "Age effect" for the different values of `Appearance` on the following plot using the model you selected in numeral 5. Take `YrsFirm = 10` and  make sure to write down the equations as well.  
8. The sales director reasons that as age increases the percentage of sales quota goes up, all else being equal.  According to the model in numeral 5, is the sales director correct? Explain. 

