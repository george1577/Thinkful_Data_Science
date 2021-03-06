# Capstone Project 2

## Problem: Tennis match prediction
![Images](https://raw.githubusercontent.com/george1577/Thinkful_Data_Science/master/Capstone%20project/Capstone%20project%202/Images/atp_tennis.jpg)
### Abstract
In this project, our goal is to use stats from previous matches players played as features to predict their future matches outcome. We used both traditional machine learning models as well as deep learning models to compare the result. We have also done feature selection and engineering to extract the most valuable features for our model. We were able to reach nearly 93% of test set accuracy consistently and also use it to predict the winning/losing percentage of a player in a certain match, which could be a potential application for sports bidding companies to use as a reference to set up the odds of every single upcoming match.
### Introduction
[Tennis](https://en.wikipedia.org/wiki/Tennis) is a racket sport that can be played individually against a single opponent or between two teams of two players each. Each player uses a tennis racket that is strung with cord to strike a hollow rubber ball covered with felt over or around a net and into the opponent's court. The [history](https://en.wikipedia.org/wiki/History_of_tennis) of tennis sports can be traced back to 16th century when it was really popular in royals. 

The Open Era began in 1968 when major tournaments agreed to allow professional players to compete with amateurs. Before 1968, only amateurs were allowed to compete in Grand Slam tournaments and other events organized by ILTF. [The Association of Tennis Professionals(ATP)](https://en.wikipedia.org/wiki/Association_of_Tennis_Professionals) is a main men's tennis governing body, it was formed in 1972 and they organized men's professional tournaments all around the world except Grand Slam.

## Goal
As the title suggested, the major goal of this project is to build up a prediction model to succesfully predict the match outcome between two players, the prediction model is expected to apply on any kind of tournament scale, including Grand Slam, ATP Masters 1000...etc. as well as any surface(Grass, Clay, Hard..etc.) that were played on. 

The prediction outcome variable will not only produce a binary value like 0 or 1 but the winning(losing) percentage of a certain player, this might have a potential to have applications on [sports betting](https://en.wikipedia.org/wiki/Sports_betting), where the banker could use it to set up appropriate odds and earn profit out of the gamblers' pockets.

## Data Cleaning and Wrangling
1. Examine data types, missing values, outliers.
2. Extract useful information from each datasets and combine them together
3. Clean rows that has unreasonable value in a certain features.
4. Prepare training and testing set for both machine learning and deep learning model.

**Complete notebook**: [Data cleaning and wrangling](https://github.com/george1577/Thinkful_Data_Science/blob/master/Capstone%20project/Capstone%20project%202/Data%20cleaning_wrangling/Data_cleaning.ipynb) 

## Exploratory Data Analysis
1. Perform univariate analysis to find out distribution of variables.
2. Perform bivariate analysis to find out relationship between variables.
3. Find important features that are highly associated with outcome variable.
4. Perform statistical hypothesis test.

**Complete notebook**: [Exploratory data analysis](https://github.com/george1577/Thinkful_Data_Science/blob/master/Capstone%20project/Capstone%20project%202/Exploratory%20Data%20Analysis/Exploratory_Data_Analysis.ipynb) 

## Feature Engineering
1. Generate feature interaciton variables.
2. Standardize and normalize numeric variables.
3. Perform feature selection using statistical and model-based methods.
4. Perform principal component analysis.
5. Prepare all the engineered data for both training and testing set.

**Complete notebook**: [Feature engineering](https://github.com/george1577/Thinkful_Data_Science/tree/master/Capstone%20project/Capstone%20project%202/Feature%20Engineering) 

## Modeling
1. Use different algorithm and data pair to find out the best combination.
2. Compare traditional ML model and deep learning model.
3. Determine the best model in terms of score, training time and consistency of performance.

**Complete notebook**: [Modeling](https://github.com/george1577/Thinkful_Data_Science/blob/master/Capstone%20project/Capstone%20project%202/Modeling/Modeling.ipynb)

[**Complete report**](https://github.com/george1577/Thinkful_Data_Science/tree/master/Capstone%20project/Capstone%20project%202/Report)













