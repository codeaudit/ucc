\name{ucc.delta}
\alias{ucc.delta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Computes absolute values of deltas, to aid in computing the UCC.
}
\description{
  Given a two-column data frame of numeric data with columns \var{x} and \var{y}, this function returns the vector consisting of absolute values of successive differences of the dependent variable in the data frame (as determined by \code{dependent}, below).
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
  Returns the vector of absolute values of successive differences of the dependent variable.
}

\examples{
x <- c(3,5.1,0,3.1,4.4,7)
y <- c(9,-2,1,4.4,0,2.718)
dat <- data.frame(x=x,y=y)

ucc.delta(dat)
r <- ucc.ranks(dat)
ucc.delta(r)
}

