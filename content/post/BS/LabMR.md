+++
date      = 2022-08-05
lastmod   = 2022-08-05
draft     = false
math      = true
+++

The sales director for an industrial supplies firm has collected information describing the performance and personal characteristics of 80 members of her sales force. The data in file `Performance.csv` include the percent of sales quota the salesperson achieved last year, age, number of years with the firm, and personal appearance (very neat, about average, or a little sloppy). In the data file, a very neat person is coded as `Appearance = 0`, a person of average neatness is coded as `Appearance = 2`, and a sloppy person  is coded as `Appearance = 1`.  

* With percentage of sales quota as the response, perform a linear regression using the other variables as predictors.  Write down your fitted model and test the overall fit of the regression (You only need to write the hypotheses, the test statistic and  your decision).
* Find a 95% confidence interval for $\beta_{\texttt{Age} }$ using the model in part (a).
* Assume that a junior salesman is 40 years old and has one year of experience. Based on the model fitted in part (a), we know that the expected percentage of his sales quota is 46.75\%.  Is he a sloppy person? Make sure you show your work (answering only `yes' or `no' will give you no points). 
* Assume that a salesman is 50 years old and has ten years of experience. Based on the model fitted in part (a), what is the expected maximum and expected minimum for the mean percentage of sales quota for this salesman? 
* The sales director thinks that there is an interaction between `Appearance` and the other predictors (`Age` and `YrsFirm`).  Write down the model based on the sales director's believe and test whether or not there is an interaction between `YrsFirm` and  `Appearance`. That is, assume that your full model includes the interactions between `Appearance` and the other predictors `Age` and `YrsFirm` and your reduced model includes the interaction between `Appearance`  and `Age` but excludes the  interaction between `Appearance`  and `YrsFirm`. State the hypotheses to be tested, your test statistic, its critical value, your decision and your conclusion.  

