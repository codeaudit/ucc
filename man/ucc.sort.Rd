\name{ucc.sort}
\alias{ucc.sort}
\title{
  Sorts a data frame by one variable with respect to the other
}
\description{
  Given a data frame with columns \var{x} and \var{y} containing numeric data, this function sorts one of the columns with respect to the other (depending on the value of \var{dependent}).
}

\arguments{
  \item{df}{
  The data frame that you wish to use. It must consist of exactly two columns of \code{numeric} data with no \code{NA} values. The first and second columns are considered to be the columns of \var{x} and \var{y} values, respectively.
}
  \item{dependent}{
    An integer argument that can only take on the values 1 or 2, signifying that \var{x} or \var{y} should be the dependent variable (respectively). The default is for \var{y} to be the dependent variable.
  }
}

\value{
  Returns the sorted data frame.
}

\examples{
x <- c(3,5.1,0,3.1,4.4,7)
y <- c(9,-2,1,4.4,0,2.718)
dat <- data.frame(x=x,y=y)

ucc.sort(dat)
ucc.sort(dat,1)
}

