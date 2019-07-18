from sklearn.model_selection import GridSearchCV

def get_best_model_accuracy(model, params, X, y, score):
    grid = GridSearchCV(model, params, scoring=score, error_score=0., cv=5)
    grid.fit(X, y)
    # our classical metric for performance
    print("Best " + score + " : {}".format(grid.best_score_))
    # the best parameters that caused the best accuracy
    print("Best Parameters: {}".format(grid.best_params_))
    # the average time it took a model to fit to the data (in seconds)
    print("Average Time to Fit (s): {}".format(round(grid.cv_results_['mean_fit_time'].mean(), 3)))
    # the average time it took a model to predict out of sample data (in seconds)
    # this metric gives us insight into how this model will perform in real-time analysis
    print("Average Time to Score (s): {}".format(round(grid.cv_results_['mean_score_time'].mean(), 3)))
    return grid.best_params_, grid.best_score_

def roc_curve_plot(model, params, X, y):
    from sklearn.model_selection import cross_val_predict
    from sklearn.metrics import precision_score, recall_score
    from sklearn.metrics import f1_score
    from sklearn.metrics import roc_curve
    from sklearn.metrics import roc_auc_score
    from sklearn.model_selection import train_test_split

    X_train, X_test, y_train, y_test = train_test_split(cancer_raw.drop('Class', axis=1), cancer_raw['Class'],
                                                test_size=0.3, stratify=cancer_raw['Class'], random_state=1009)

    model.set_params(**params)
    model.fit(X_train, y_train)
    print('Precision: {}'.format(precision_score(y_test, model.predict(X_test))))
    print('Recall: {}'.format(recall_score(y_test, model.predict(X_test))))
    print('F1 score: {}'.format(f1_score(y_test, model.predict(X_test))))

    try:
        y_scores = cross_val_predict(model, X, y, method='decision_function', cv=5)
    except AttributeError:
        y_scores = cross_val_predict(model, X, y, method='predict_proba', cv=5)[:,1]

    fpr, tpr, thresholds = roc_curve(y, y_scores)
    plt.plot(fpr, tpr, linewidth=2)
    plt.plot([0, 1], [0, 1], 'k--')
    plt.axis=([0, 1, 0, 1])
    plt.xlabel('False Positive Rate')
    plt.ylabel('True Positive Rate')
    plt.title('ROC curve')
    plt.show()
    print('Area under the curve: {}'.format(roc_auc_score(y, y_scores)))

def print_confusion_matrix(confusion_matrix, class_names, figsize = (10,7), fontsize=14):
    import pandas as pd
    import matplotlib.pyplot as plt
    import seaborn as sns
    """Prints a confusion matrix, as returned by sklearn.metrics.confusion_matrix, as a heatmap.

    Arguments
    ---------
    confusion_matrix: numpy.ndarray
        The numpy.ndarray object returned from a call to sklearn.metrics.confusion_matrix.
        Similarly constructed ndarrays can also be used.
    class_names: list
        An ordered list of class names, in the order they index the given confusion matrix.
    figsize: tuple
        A 2-long tuple, the first value determining the horizontal size of the ouputted figure,
        the second determining the vertical size. Defaults to (10,7).
    fontsize: int
        Font size for axes labels. Defaults to 14.

    Returns
    -------
    matplotlib.figure.Figure
        The resulting confusion matrix figure
    """
    df_cm = pd.DataFrame(
        confusion_matrix, index=class_names, columns=class_names,
    )
    fig = plt.figure(figsize=figsize)
    try:
        heatmap = sns.heatmap(df_cm, annot=True, fmt="d", cmap="YlGnBu")
    except ValueError:
        raise ValueError("Confusion matrix values must be integers.")
    heatmap.yaxis.set_ticklabels(heatmap.yaxis.get_ticklabels(), rotation=0, ha='right', fontsize=fontsize)
    heatmap.xaxis.set_ticklabels(heatmap.xaxis.get_ticklabels(), rotation=45, ha='right', fontsize=fontsize)
    plt.ylabel('True label')
    plt.xlabel('Predicted label')
