% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crown.R
\name{crown}
\alias{crown}
\title{Crown champions}
\usage{
crown(formula, data, subset, na.action, ...)
}
\arguments{
\item{formula}{A one-sided formula with three terms: circumference, height, and spread (in
that order). Optionally, species can be denoted with the special function \code{special()}.}

\item{data}{A data.frame containing variables from \code{formula}.}

\item{subset}{An optional vector of subsetting.}

\item{na.action}{What to do with NAs.}

\item{...}{Other arguments (not in use at this time)}
}
\value{
An object of class \code{"championtree_crowned"}
}
\description{
A simplified (ignores year submitted) tree crowning algorithm.
}
\examples{
  data(champions)
  crown(~ circumference + height + spread + species(circumference), data = champions)
}
