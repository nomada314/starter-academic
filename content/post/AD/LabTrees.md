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
* Consider the attribute TravelCost (\$ per km) which has three categories: Cheap, Standard and Expensive. Sort the table $S_i$ = [TravelCost,Transportation] based on the values of TravelCost. Then separate each category of TravelCost and compute the degree of impurity using the Gini index.
* Compute the degree of impurity when considering the attribute TravelCost, this time using the entropy.

The reason for different ways of computation of impurity degrees between data table $D$ and subset table $S_i$ is because we would like to compare the difference of impurity degrees before we split the table (i.e. data table $D$) and after we split the table according to the values of an attribute $i$ (i.e. subset table $S_i$) . The measure to compare the difference of impurity degrees is called {\it information gain}. We would like to know what our gain is if we split the data table based on some attribute values. Information gain is computed as impurity degrees of the parent table and weighted summation of impurity degrees of the subset table. The weight is based on the number of records for each attribute values. Suppose we will use entropy as measurement of impurity degree, then we have:

\[\text{Information gain}(S_i) = \text{Entropy of }D - \sum_{k=1}^m \frac{n_i}{n} \text{ Entropy of class k in subset table } S_i\]

* Compute the information gain of the transportation mode dataset, when using TravelCost as the attribute for the first partition, using entropy as measurement of impurity degree.

* Compute the information gain for the other attributes in the dataset: Gender, CarOwn and Income.
* Summarize the information gain for all four attributes.
* Once you get the information gain for all attributes, find the optimum attribute, i.e., the one that produces the maximum information gain. What is the optimum attribute in the first iteration of this classification tree?
* Now, what will be the optimal first partition of the classification tree?


