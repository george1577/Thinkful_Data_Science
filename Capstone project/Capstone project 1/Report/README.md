# Capstone Project 1

# Problem: Diabetes Onset Detection
![Images](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%201/Images/Diabetes-Care-Devices-Market.png)

## Introduction
Diabetes mellitus is characterized by abnormally high levels of sugar (glucose) in the blood. When the amount of glucose in the blood increases, it triggers the release of the hormone insulin from the pancreas. Insulin stimulates muscle and fat cells to remove glucose from the blood and stimulates the liver to metabolize glucose, causing the blood sugar level to decrease to normal levels.
![Chart](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%201/Images/Diabetes_chart.jpg)

There are majority two types of diabetes, type 1(5%) is an autoimmune disorder and type 2(95%) is asociated with obesity. With the rise of obesity in the United States, diabetes accounts for over 130 billion dollars of health care costs and is the fifth leading cause of death(ref.1). the number of new cases being diagnosed continues to rise. It has been estimated that of the children born in the year 2000, 1 of 3 will suffer from diabetes at some point in their lifetime(ref.2).

Diabetes is a chronic disease, we have not found an effective cure so far, it is without a doubt that prevention and prediction of diabetes is significantly important. In this project, we will use the dataset that is available from [data.world](https://data.world/data-society/pima-indians-diabetes-database), this dataset is originally from the National Institute of Diabetes and Digestive and Kidney Diseases. The patients here are all females adults from [Pima](https://en.wikipedia.org/wiki/Pima_people) group that lives in Arizona, they have been subject of intensive diabetes studies due to the highest prevalence of type 2 diabetes in the world, much more than is observed in other U.S. populations.

The dataset includes 768 patients with 8 features and 1 outcome variable:

1. Pregnancies: Number of times pregnant
2. Glucose: Plasma glucose concentration a 2 hours in an oral glucose tolerance test
3. BloodPressure: Diastolic blood pressure (mm Hg)
4. SkinThickness: Triceps skin fold thickness (mm)
5. Insulin: 2-Hour serum insulin (mu U/ml)
6. BMI: Body mass index (weight in kg/(height in m)^2)
7. DiabetesPedigreeFunction: Diabetes pedigree function, it provides information about diabetes history in relatives and genetic relationship of those relatives with patients.
8. Age: Age (years)
9. Outcome: Class variable (0 or 1)

The goal of this project is to treat all those patients, features and outcome variable as a supervised machine learing problem to predict the onset of diabetes of a particular patient given the features that were previously measured.

## Data Cleaning

### Summary
The dataset was examined first to see whether they consist of any missing values, those values were determined by the impossible values such as 0 mmHg blood pressure. We have used different approaches to impute missing values such as mean and median.

The outliers were dealt with windsorization method, which we set up a top and bottom boundary values as our celing and floor, any value beyond those were reduced/increased to the celing and floor values.

The training and testing set were also prepared in this step since we need to use the same imputed values from the training set to the testing set.

**Complete notebook**: [Data cleaning](https://github.com/george1577/Thinkful_Data_Science/blob/master/Capstone%20project/Capstone%20project%201/Data%20Cleaning/Data_cleaning.ipynb)

## Exploratory Data Analysis

### Summary
Exploratory data analysis(EDA) is an important step to get to know deeper of our dataset. We could understand better of each feature and their correlation to the outcome variable, which gives us ideas for feature seleciton as well as feature engineering when we do the future modeling.

This part has been broken into univariate analysis and bivariate analysis, the former is to find out the distribution and composition of some variables and the later to deal with the relationship between features or between features and outcome variable.

Statistical hypothesis is used in this step to compare the mean difference of certian features between non-diabetic and diabetic group.

We have found some features that are more related to the outcome variable than the others and it helped us to generate more features interaction in the feature engineering step that could potentially improve our model performance.

**Complete notebook**: [Exploratory data analysis](https://github.com/george1577/Thinkful_Data_Science/blob/master/Capstone%20project/Capstone%20project%201/Exploratory%20Data%20Analysis/Exploratory_Data_Analysis.ipynb)

## Feature Engineering

### Summary
In the feature engineering step we built a pairplot to understand the features correlation and it was separated into diabetic and non-diabetic group to see if any feature behaved significant differently between those two groups. 

Feature interaction is done by multiplying features together, we selected the feature that has opposite correlation between diabetic and non-diabetic group and hope to further separte the two droups when using the newly generated feature in our model.

We have also standardized our variables, this step is important when feeding into certain algorithms, if the feature scale is completely different from one to another, some algorithms will struggle to learn the ideal parameters(e.g. logistic regression). We have also tried different scaling methods such as z-score normalization and min-max scaling to see whether it makes any performance difference.

Pricipal component analysis(PCA) was also done in this step, it can sometimes extract useful information and get rid of the redundant information from the original dataset, we have selected some variables that we have observed higher correlation between each other in EDA and extract around 60% of information(variances) to combine the rest features together. This step is done separately from the feature interaction step, the goal is again to compare whether different feature engineering method makes any difference in model performance.

**Complete notebook**: [Feature engineering](http://localhost:8888/notebooks/Desktop/Thinkful/projects/Capstone%201/Feature%20Engineering/Feature%20Engineering.ipynb)

## Modeling
### Summary

In this part, we separated the notebook into two approaches, one using the accuracy score as our evaluation metric and the other using f1 score. Accuracy is a more intuitive approach to use in classification problem, but not suitable in a highly skewed data, since we could basically predict every example as the majority that exists in the dataset and easily gain an 95%(or even more than 99%) score, however the model would be useless to catch the minority.

Our dataset consists of 65% of non-diabetic patients and 35% of diabetic patients, which is not considered highly skewed, thus our first notebook used the accuracy score as the measurement of the model performance, we compared different machine learning algorithms from **Naive Bayes**, **K-nearest neighbors** to **Gradient Boosting** and we also incorporated dataset that were engineered differently in data cleaning and feature engineering steps, our goal is to find out the best algorithm and data combination.

We also used the f1 score as the evaluation metric in our second notebook, since in medical diagnostics, the false negative(telling someone they have no diabetes when they actually have) is likely to have bigger cost than false positive(telling someone they have diabetes when they actually do not), we used precision and recall as our side metrics to help filtering our the best model.

The modeling fitting process first included the training step to find the best parameters that have minimum cost, then we used the cross validation step to fitler our the best hyperparameters for each algorithm and data combination. Those better combination will be used in the test set and see the performance, we will again filter out more in this step, the final round we used the bootstrapping method to see the consistency and the distribution of the score, an ideal model should not vary too much when using out-of-sample data.

**Complete notebook**: [Modeling 1](https://github.com/george1577/Thinkful_Data_Science/tree/master/Capstone%20project/Capstone%20project%201/Modeling), [Modeling 2](https://github.com/george1577/Thinkful_Data_Science/blob/master/Capstone%20project/Capstone%20project%201/Modeling/Modeling_f1_score.ipynb)

## Conclusions

In this project, as stated in the beginning, our goal is to find the best model that predicts the onset of diabetes, we have gone through data cleaning, exploratory data analysis, feature engineering and modeling to come up with the following result:

1. BMI is the strongest factor among all that relates to diabetes, the average BMI value difference between diabetic and non-diabetic group is statistically significant, the p-value is at the order of 1e-19. We can see from the following graph the mean difference between diabetic and non-diabetic group is huge.
![BMI](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%201/Images/BMI.png)
2. When using accuracy score as the evaluation metric, the models that performs the best on the test set are `SVM_median-min-max`, `SVM_mean-min-max`, `Naive_Bayes_mean-z-score` and `Naive_Bayes_mean-min-max`, we further compare those four using bootstrapping method, the former two outbeat the later two in accuracy score, the consistency is about the same between four. The t-test further distinguished the difference between the former two, we can conclude that `SVM_median-min-max` is our best model in terms of accuracy score, the follow graph shows the bootstrapping result with 2000 iterations.
![SVM](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%201/Images/SVMmedian-min-max.png)
The mean score is 0.77048 and the standard deviation is 0.0425
3. When using f1 score as the evaluation metric, the models performs the best differed from using accuracy score, we again used the bootstrapping method to see the average performance and consistency of the model, decision tree with PCA data outperformed the other algorithms in terms of f1 score and recall, especially `Decision_tree_median_min_max_PCA`, we also used the t-test to double confirm it is indeed the best model. The following graph shows the f1 score and recall distribution of `Decision_tree_median_min_max_PCA`.
![dt](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%201/Images/Decision_treemedian-min-max-PCA.png) 
4. We came up with different best model by using different evaluation metrics, however, we have stated that in medical diagnostics, the f1 score and recall will be more important than accuracy score, by scrificing a little of accuracy, `Decision_tree_median_min_max_PCA` has better f1 score and recall combination, thus we conclude that this is the best model over all, the following shows the graph how the model split the branch during training:

![dt_visual](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%201/Images/Decision_tree_visualization.png)
We can see that the most important feature we generated for this model is the component 1 of PCA, this can explain that the most of the features information is retained in the first component that better separates the non-diabetic and diabetic group, another advantage of the model is the training speed since decision tree is a relatively simple model. One explaination of the random forest did not perform better than the decision tree is because random forest tend to pick the "random features" in each estimator, sometimes it picked the important one like PCA1 but sometimes it did not, thus the overall performance was worse.

## Next step
1. Since our data only consists of 768 patients, this might not generalize for out of sample patients, one thing we could do is to collect more training examples to reduce the variance.
2. The patients are exclusively Pima people, this might be an issue to apply to more general population, we can gather another dataset that have different people nationalwise.
3. This dataset was collected around 30 years ago, some measurement might be obsolete, one thing we could do is to generate more features from medical technology nowadays.

## References
1. Hogan P , Dall T , Nikolov P . Economic costs of diabetes in the US in 2002. Diabetes Care. 2003;26(3):917–932.
2. Narayan K M , Boyle J P , Thompson T J , Sorensen S W , Williamson D F . Lifetime risk for diabetes mellitus in the United States. JAMA. 2003;290(14):1884–1890. 





