# DRILL - Descriptive Statistics and Normality

To complete the following drills, you'll need to use your Python skills to create some datasets, then use your new statistical knowledge to summarize them. Choose 6 distributions from the list of random distributions available in NumPy, called [“Distributions”](https://docs.scipy.org/doc/numpy/reference/routines.random.html#distributions)

For each distribution:

1. Generate a random variable with 100 datapoints using the code `distributionvar = np.random.distributionname([arguments], 100)`, replacing `distributionvar` with an appropriate variable name and `distributionname` with the name of the distribution you’ve chosen, and filling in the empty space in the parentheses with your chosen values for the appropriate parameters. If you feel uncertain about how to do this, go back to the “Other Distributions” assignment for examples of code to use as a starting point.

2. Graph the variable using a histogram.

3. Compute the mean and standard deviation and plot them as vertical lines on the histogram. (Hint: the “When Does It Break?” assignment you just completed can help you here.)

4. Evaluate whether the descriptive statistics provided useful information about the variable. Can you identify any common characteristics of the distributions that could be usefully described using the mean and/or standard deviation, versus the ones that could not?

Additionally:

1. Generate two normally-distributed variables, one with a mean of 5 and standard deviation of 0.5, and the other with a mean of 10 and standard deviation of 1.

2. Add them together to create a third variable.

3. Graph the third variable using a histogram.

4. Compute the mean and standard deviation and plot them as vertical lines on the histogram.

5. Evaluate the descriptive statistics against the data.

When you've given it a try, you can find a sample solution [here](https://github.com/Thinkful-Ed/data-201-resources/blob/master/solutions/Prep%20course/3.3.4.ipynb).
