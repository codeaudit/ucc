\name{ucc-package}
\alias{ucc-package}
\alias{ucc}
\docType{package}
\title{
Computation of a Universal Correlation Coefficient
}
\description{
At the 2011 Joint Statistical Meetings, Nuo Xu of the University of Alabama at Birmingham presented a paper--coauthored with Xuan Huang also of UAB and Samuel Huang at the University of Cincinatti--in which a Universal Correlation Coefficient is defined and developed. This coefficient measures the degree of dependency (but not the form of dependency) for two discrete random variables.

Given two discrete random variables (with no NAs), called \var{x} and \var{y}, we do the following:

\enumerate{
    \item Sort \var{y} with respect to \var{x} (see \code{ucc.sort}).
    
    \item Compute the ranks of the sorted \var{y} values (see \code{ucc.ranks}).
    
    \item Take the absolute value of successive differences of ranks computed in step 2 (see \code{ucc.delta}).
    
    \item Assuming that these ranks are iid random variables, and letting \var{A} denote the sample mean of the deltas from step 3, it can be show that \eqn{E(A) = (n + 1)/3}, where \var{n} is the number of observations. We then define \var{ucc.y} to be \eqn{ucc.y = 1 - (A / E(A)) = 1 - (3 * A)/(n + 1)}. We can think of \var{ucc.y} as measuring the degree of dependence of \var{y} on \var{x}.
    
    \item We can switch \var{x} and \var{y} to compute \var{ucc.x} in an analagous manner. 
    
    \item We define \var{ucc} to be \var{ucc = max(ucc.x,ucc.y)}.
    
  }

}
\details{
\tabular{ll}{
Package: \tab ucc\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-06-19\cr
License: \tab MIT\cr
}
}
\author{
Jack Maney <jackmaney@gmail.com>
}
\references{
http://www.amstat.org/meetings/jsm/2011/onlineprogram/AbstractDetails.cfm?abstractid=303386
}
\keyword{ package correlation coefficient}

\examples{

library(ucc)
## Generate some data that's close to fitting on a curve, with some noise
x <- runif(1000)
dat <- data.frame(x=x,y=exp(x)*cos(2*pi*x) + runif(1000,-0.1,0.1))

cor(dat$x,dat$y)  # Low, even though there's obviously a relationship.

ucc.ucc(dat)    # Much higher.
                      

}
