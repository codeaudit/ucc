#Universal Correlation Coefficient

At the 2011 Joint Statistical Meetings, Nuo Xu of the University of Alabama at Birmingham presented a paper--coauthored with Xuan Huang also of UAB and Samuel Huang at the University of Cincinatti--in which a Universal Correlation Coefficient is defined and developed. This coefficient measures the degree of dependency (but not the form of dependency) for two discrete random variables.

This R package implements the algorithm described in the paper presented at the above talk.

##Example

    library(ucc)

We first grab 1,000 random `x` values between 0 and 1:

    x <- runif(1000)

We then make these points close to fitting on a curve (with a bit of randomly-generated noise):

    dat <- data.frame(x=x,y=exp(x)*cos(2*pi*x) + runif(1000,-0.1,0.1))

If you plot these data points, you'll see that there's an obvious (contrived) relationship, albeit not a linear relationship.

![scatterplot](https://github.com/jackmaney/ucc/blob/master/img/scatterplot.png)

Predictably, the Pearson Correlation coefficient (ie the covariance divided by the product of standard deviations) does not reveal a linear relationship (due to randomness, exact values will vary, but it will probably be around 0.2)

    cor(dat$x,dat$y)  # Low, even though there's obviously a relationship.

The Universal Correlation Coefficient briefly described above measures the *degree* of dependency independent of the *form* of dependency (again, exact values will vary, but you should get UCC values above 0.9).

    ucc.ucc(dat)    # Much higher.

Check out the R documentation for more details about the algorithm.
