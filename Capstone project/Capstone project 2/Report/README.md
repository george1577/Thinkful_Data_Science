# Capstone Project 2

## Problem: Tennis match prediction
![Images](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%202/Images/atp_tennis.jpg)

### Introduction
[Tennis](https://en.wikipedia.org/wiki/Tennis) is a racket sport that can be played individually against a single opponent or between two teams of two players each. Each player uses a tennis racket that is strung with cord to strike a hollow rubber ball covered with felt over or around a net and into the opponent's court. The [history](https://en.wikipedia.org/wiki/History_of_tennis) of tennis sports can be traced back to 16th century when it was really popular in royals. 

The Open Era began in 1968 when major tournaments agreed to allow professional players to compete with amateurs. Before 1968, only amateurs were allowed to compete in Grand Slam tournaments and other events organized by ILTF. [The Association of Tennis Professionals(ATP)](https://en.wikipedia.org/wiki/Association_of_Tennis_Professionals) is a main men's tennis governing body, it was formed in 1972 and they organized men's professional tournaments all around the world except Grand Slam.

As the title suggested, the major goal of this project is to build up a prediction model to succesfully predict the match outcome between two players, the prediction model is expected to apply on any kind of tournament scale, including Grand Slam, ATP Masters 1000...etc. as well as any surface(Grass, Clay, Hard..etc.) that were played on. 

The raw data we used for analysis and prediction was directly download from datahub.io and is available [here](https://datahub.io/sports-data/atp-world-tour-tennis-data#data-cli), we gather the information from four different datasets and combine to a single dataset for model prediction. The raw dataset we used including:

1. tournaments: dataset that provides information of a single tournament from year 1877 to 2017.
2. match_scores: dataset that provides information of a single match, such as winner, loser, round order , match order...etc.
3. match_stats: dataset that provides detail statistics of a single match, including total points won, total aces, total break points converted...etc.
4. ranking: dataset that provides detail ranking information of every single week from 1973 to 2017, features include ranking points, ranking position, player id...etc.  

Our ultimate goal is to not only produce a binary value like 0 or 1 to indicate who is likely to win the match but the winning(losing) percentage of a certain player, this might have a potential to have applications on [sports betting](https://en.wikipedia.org/wiki/Sports_betting), where the banker could use it to set up appropriate odds and earn profit out of the gamblers' pockets.



## Data Cleaning and Wrangling
### Summary
We have four raw datasets as mentioned above, we related each raw dataset using primary keys between two tables and combine all the information together into one single table. Ranking information features were added separately using the timing of a certain match and trace it back to the ranking table to extract players's ranking info at that time.

Since we have plenty of training examples(more than 90K), missing values were dealt with simply dropping the rows that had missing values. Outliers were examined on feature by feature basis using tennis domain knowledge, certain values were theoritically possible but very unlikely to happen. Example with those values were simply dropped as well.

We have also dealt with players that were **not active**, professional sports are very competitive, especially the individual sport like tennis, some players have struggled and have only few matches recorded in the database, those examples did not really help our model prediction so were dropped as well.

The ranking system has changed dynamically since introduced, thus we seprate the processed dataset into two: one with matches between 2009-2017 and the other with matches between 1991-2017, the former included `ranking_points` variables while the later did not. Details are further explained in the notebook.

Finally, we dealt with training/testing set preparation of both traditional machine learning and deep learning model since they required different format of examples input.

**Complete notebook**: 

## Exploratory Data Analysis
### Summary
We used the processed data as well as training examples(includes match `outcome` variable) from previous notebook to dig out some information and get ideas when doing feature engineering. The data we used for EDA had matches ranging from 1991 to 2017.

We performed univariate analysis on some interesting variables such as `match_duration`, which inspired us to deal with the examples that have theoretical possible value but unlikely to happen again. We also found the composition of our dataset in terms of tournament scale. The next part we did was bivariate analysis in order to find out the relationship between features and features and most importantly, the outcome variables.

Statisical hypothesis was also performed to use it as a tool to confirm if our findings were statistically significant or not.

The current [tennis big 4](https://en.wikipedia.org/wiki/Big_Four_(tennis)) are popular topics among tennis fans all around the world, we have also showed some interesting facts in this notebook to demonstrate how hard it is for other players to break the dominance.

Since there were thousands of features in our training examples, it is impractical to examine all the features one by one and dig out the important ones that were mostly related to the `outcome` variable. In stead, we use our tennis domain knowledge to hand pick some variables and explore the relationship between those variables and the `outome`. 

**Complete notebook**: 

## Feature Engineering
### Summary
In this notebook, our first step was to use our tennis domain knowledge to generate new features from feature interaction, for example, most of the stats of the match showing on TV used percentage basis rather than point basis, such as `first serve percentage`, `second serve winning percentage`...etc.

We have also standardized our variables, this step is important when feeding into certain algorithms, if the feature scale is completely different from one to another, some algorithms will struggle to converge to the ideal parameters.

Feature selection was also done in this notebook, we had thousands of variables in our training examples and extracting out the important features might be helpful to accelerate the training process. We have used two approaches: statistical-based and model-based and compare the difference.

Another dimension reduction method we used was principal component analysis(PCA), it can sometimes extract useful information and get rid of the redundant information from the original dataset. We set a threshold of 99.5% variance retained to extract about the same number of features as we did in feature selection steps(around 500).

**Complete notebook**: 

## Modeling
### Summary
In this notebook, we have prepared two training examples, one has matches between 1991 to 2017 and the other has mathces ranges between 2009 to 2017, the former one did not includes `ranking_points` variable since the ranking system has changed overtime during that period, on the other hand, the later includes `ranking_points` variable because the current ranking system was implemented since 2009. Besides, we also performed different feature engineering technique from the previous notebook and compared the performance using different training examples. 

We tried different combination of dataset and modeling to find out the best pair, we also used grid search to tune the hyperparameters of each model. The modeling techniques included traditional machine learning and deep learning model. 

After we found out the best combination and hyperparameters using training and validation set, we then used the test set to figure out the best model in terms of accuracy, training time and consistency. 

As mentioned, the ultimate goal of this project is to build up a good predicting model that can output the winning and losing percentage of a certain player so we could use them to set up the odds. We used the `softmax` activation function in the output layer of RNN to fulfill this goal.

**Complete notebook**: 

## Conclusions


## Next step
1. Due to computation resource limit, the training set size we used was only around 10K to 12K, however, we could potentially generate more than 50K of training examples for our model, this could be further improve our variance issue and get more general prediction model.
2. We have used stats from previous 10 matches as our features, this could be tuned to the optimal level as well, especially for RNN model that takes a time sequence of events, using different number of matches can potentially improve our model.
3. The outcome variable we have chosen in this project is the binary win/lose outcome(or winning/losing percentage), we could easily change to different outcome we would like to predict, such as total score difference(regression problem).
4. In this project, we did not examine the examples that the model failed to predict correctly, there might exist a pattern, for example, model may be more fragile dealing with two players with close ranking points. We could add more features to deal with special cases to improve accuracy further.











