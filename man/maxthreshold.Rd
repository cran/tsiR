% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/maxthreshold_function.R
\name{maxthreshold}
\alias{maxthreshold}
\title{maxthreshold}
\usage{
maxthreshold(
  data,
  nsim = 2,
  IP = 2,
  method = "deterministic",
  inits.fit = FALSE,
  parms,
  thresholdmin = 2,
  thresholdmax = 20,
  printon = FALSE
)
}
\arguments{
\item{data}{The time, cases, births, pop data frame.}

\item{nsim}{The number of simulations to do.}

\item{IP}{The infectious period, which should the time step of the data.}

\item{method}{The forward simulation method used, i.e. deterministic, negbin, pois.}

\item{inits.fit}{Whether or not to fit initial conditions as well. Defaults to FALSE here. This parameter is more necessary in more chaotic locations.}

\item{parms}{The estimated parameters from estpars or mcmcestpars.}

\item{thresholdmin}{The minimum number of cases to be considered an outbreak.}

\item{thresholdmax}{The max number of cases to be considered an outbreak.}

\item{printon}{A T/F statement to print the progress.}
}
\description{
A function used to optimize the threshold parameter to give the best fit to the data. Optimizes the fit based on R squared.
}
\examples{
require(kernlab)
Mold <- twentymeas[["Mold"]]
plotdata(Mold)
\dontrun{
parms <- estpars(data=Mold,alpha=0.97)
tau <- maxthreshold(data=Mold,parms=parms,
thresholdmin=8,thresholdmax=12,inits.fit=FALSE)
res <- simulatetsir(data=Mold,parms=parms,
epidemics='break',threshold=tau,method='negbin',inits.fit=FALSE)
plotres(res)
}
}
