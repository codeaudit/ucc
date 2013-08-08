#Universal Correlation Coefficient

At the 2011 Joint Statistical Meetings, Nuo Xu of the University of Alabama at Birmingham presented a paper--coauthored with Xuan Huang also of UAB and Samuel Huang at the University of Cincinatti--in which a Universal Correlation Coefficient is defined and developed. This coefficient measures the degree of dependency (but not the form of dependency) for two discrete random variables.

This R package implements the algorithm described in the paper presented at the above talk.

##Example

    library(ucc)

We first grab 1,000 random `x` values between 0 and 1:

    set.seed(1234) #for reproducability
    x <- runif(1000)

We then make these points close to fitting on a curve (with a bit of randomly-generated noise):

    dat <- data.frame(x=x,y=exp(x)*cos(2*pi*x) + rnorm(1000,-0.1,0.1))

If you plot these data points, you'll see that there's an obvious (contrived) relationship, albeit not a linear relationship.

![scatterplot](https://raw.github.com/jackmaney/ucc/master/img/scatterplot.png)

Predictably, the Pearson Correlation coefficient (ie the covariance divided by the product of standard deviations) does not reveal a linear relationship

    cor(dat$x,dat$y)  # equals 0.2666508

The Universal Correlation Coefficient briefly described above measures the *degree* of dependency independent of the *form* of dependency.

    ucc(dat)$ucc    # equals 0.9057609

Check out the R documentation for more details about the algorithm.

##Install

* Clone the repository:

        git clone https://github.com/jackmaney/ucc.git ~/ucc

(of course, feel free to use a different directory than `~/ucc`, if you'd like)
* In the **parent directory** of the repository (ie `~` if you cloned to `~/ucc`), run the following

        R CMD build ucc

This will generate a `tar.gz` file.
* Run the following:

        R CMD INSTALL ucc_<x.y.z>.tar.gz

where `<x.y.z>` is the latest version number of the `ucc` library.