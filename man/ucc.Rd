\name{ucc}
\alias{ucc}
\alias{ucc.x}
\alias{ucc.y}

\title{
Computes the UCC
}
\description{
  This is the only function that the end-user generally needs to call. It computes each of \var{ucc.x} and \var{ucc.y}, takes the maximum, and returns these items in a list.
}

\arguments{
  \item{df}{
  The data frame that you wish to use. It must consist of exactly two columns of \code{numeric} data with no \code{NA} values. The first and second columns are considered to be the columns of \var{x} and \var{y} values, respectively.
}
}

\value{
Returns a list with the following values:


\item{n}{The number of observations of the data within \var{df}}
\item{ucc.x}{The computed value of ucc.x}
\item{ucc.y}{The computed value of ucc.y}
\item{ucc}{The computed UCC value--ie \eqn{max(ucc.x,ucc.y)}}.

}




