+++
date      = 2022-07-07
lastmod   = 2022-07-07
draft     = false
tags      = ["Teaching"]
title     = "Árboles de decisión"
math      = true
+++

The following table contains the ten observations of this dataset. The last column is the class variable, all the other variables are attributes. The goal is to predict the Transportation mode using a classification tree.

Gender|	CarsOwn|	TravelCost|	Income|	Transportation\\
|:-------|:-------|:-------|:-------|:-------|
Male|	0|	Cheap|	Low|	Bus
Male|	1|	Cheap|	Medium|	Bus
Female| 0|	Cheap|	Low|	Bus
Male|	1|	Cheap|	Medium|	Bus
Female|	1|	Expensive|	High|	Car
Male|	2|	Expensive|	Medium|	Car
Female|	2|	Expensive|	High|	Car
Female|	1|	Cheap|	Medium|	Train
Male|	0|	Standard|	Medium|	Train
Female|	1|	Standard|	Medium |Train

* Compute the Gini index using only the Transportation variable.
* Compute the entropy using only the Transportation variable.
* Consider the attribute TravelCost (dollars per km) which has three categories: Cheap, Standard and Expensive. Sort the table $S_i$ = [`TravelCost`,`Transportation`] based on the values of TravelCost. Then separate each category of `TravelCost` and compute the degree of impurity using the Gini index.
* Compute the degree of impurity when considering the attribute `TravelCost`, this time using the entropy.

The reason for different ways of computation of impurity degrees between data table $D$ and subset table $S_i$ is because we would like to compare the difference of impurity degrees before we split the table (i.e. data table $D$) and after we split the table according to the values of an attribute $i$ (i.e. subset table $S_i$) . The measure to compare the difference of impurity degrees is called *information gain*. We would like to know what our gain is if we split the data table based on some attribute values. Information gain is computed as impurity degrees of the parent table and weighted summation of impurity degrees of the subset table. The weight is based on the number of records for each attribute values. Suppose we will use entropy as measurement of impurity degree, then we have:

$$\text{Information gain}(S_i) = \text{Entropy of }D - \sum_{k=1}^m \frac{n_i}{n} \text{ Entropy of class k in subset table } S_i$$

* Compute the information gain of the transportation mode dataset, when using `TravelCost` as the attribute for the first partition, using entropy as measurement of impurity degree.

* Compute the information gain for the other attributes in the dataset: `Gender`, `CarOwn` and `Income`.
* Summarize the information gain for all four attributes.
* Once you get the information gain for all attributes, find the optimum attribute, i.e., the one that produces the maximum information gain. What is the optimum attribute in the first iteration of this classification tree?
* Now, what will be the optimal first partition of the classification tree?


* Install and load the library `rpart`. Read about the `kyphosis` dataset . The task is to predict if kyphosis was present after the corrective spinal surgery. What is the response variable for this task? 

* To grow a tree, use 

```r
arbol1 <- rpart(Kyphosis ~ Age + Number + Start,method="class", data=kyphosis)`
```


The following functions help us to examine the results.

|Function | Task |
|:--------|:--------|
`printcp(fit)` |display cp (complexity parameter) table|
`print(fit)`	|print results|
`summary(fit)`	|detailed results including surrogate splits|
`plot(fit)`	| plot decision tree|
`text(fit)`	| label the decision tree plot|
`post(fit, file=)`	|create postscript plot of decision tree|


* Execute the first command of the previous table for your classification tree of the kyphosis dataset. From that output answer: what variables are actually used in the tree construction? And, what is the Root node error?

* Execute the following code. How many terminal nodes does the full classification tree has?

```r
par(xpd=NA)
plot(fit)
text(fit)
```

* A patient who is 2 years old, has the fifth vertebrae involved for corrective surgery. According to the classification tree, would kyphosis would be present or absent after the operation?  

* From the previous plot can you answer which terminal nodes are pure?

* Execute the following code. Which nodes are pure? Write down the classification tree rules that end up in pure nodes and the class assigned to the observations in the pure nodes.


```r
plot(fit, uniform=TRUE, main="Classification Tree for Kyphosis")
text(fit, use.n=TRUE)
```

* From this last tree, compute the confusion matrix of the training data by hand.


Prune back the tree to avoid overfitting the data. Typically, you will want to select a tree size that minimizes the cross-validated error, the `xerror` column printed by `printcp()`. 

* Prune the tree to the desired size using

```r
prune(fit, cp= )
```

Specifically, use `printcp()` to examine the cross-validated error results, select the complexity parameter associated with minimum error, and place it into the `prune()` function. Alternatively, you can use this code fragment to automatically select the complexity parameter associated with the smallest cross-validated error:

```r
fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"]
```


* Prune the full tree of the kyphosis dataset using  the complexity parameter associated with the smallest cross-validated error. How many terminal nodes does the pruned tree have?

* Any of the terminal nodes in the pruned tree is a pure node?

* Compute the misclassification error rate of the pruned tree.
