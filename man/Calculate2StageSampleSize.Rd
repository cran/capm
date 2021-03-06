% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Calculate2StageSampleSize.R
\name{Calculate2StageSampleSize}
\alias{Calculate2StageSampleSize}
\title{Two-stage cluster sampling size and composition (Deprecated)}
\usage{
Calculate2StageSampleSize(psu.ssu = NULL, psu.x = NULL,
  conf.level = 0.95, error = 0.1, cost = 4, minimum.ssu = 15)
}
\arguments{
\item{psu.ssu}{\code{\link{data.frame}} with all primary sampling units (PSU). First column contains PSU unique identifiers. Second column contains \code{\link{numeric}} PSU sizes.}

\item{psu.x}{\code{\link{data.frame}}. Each row corresponds to a secondary sampling unit (SSU) included in a pilot study. First column contains the PSU identifiers to which the ssu belongs to. Second column contains the totals observed in the ssu and must be \code{\link{numeric}}.}

\item{conf.level}{the confidence level required. It must be \code{\link{numeric}} between 0 and 1 inclusive.}

\item{error}{the maximum relative difference between the estimate and the unknown population value. It must be \code{\link{numeric}} between 0 and 1 inclusive.}

\item{cost}{the ratio of the cost of sampling a PSU to the cost of sampling a SSU.}

\item{minimum.ssu}{integer to define the minimum number of SSU to be selected per PSU. If the calculated number of SSU to be selected is lesser than \code{minimum.ssu}, it is redefined as \code{minimum.ssu}. To avoid any lower threshold, define \code{minimum.ssu} as equal to 0.}
}
\value{
Matrix with the sample size and composition and with variability estimates.
}
\description{
Calculates sample size and composition to estimate a total from a two-stage cluster sampling design. This function is deprecated, see details.
}
\details{
It is assumed that PSU from the pilot are selected with probability proportional to size (PPS) and with replacement. SSU are assumed to be selected via simple (systematic) random sampling.

PSU must have the same identifiers in \code{psu.ssu} and in \code{psu.x}.
This function is deprecated because a study (Baquero et. al, 2018a) showed that the calculated sample size are too large for practical purposes. The same study found predefined sample compositions that result in estimates with precision equivalent to that achieved with the algorithm implemented in this function.
The predefined sample compositions are (PSU * SSU): 65 \* 15, 50 \* 20, and 30 \* 30. If possible, take larger samples.
}
\references{
Baquero, O. S., Marconcin, S., Rocha, A., & Garcia, R. D. C. M. (2018). Companion animal demography and population management in Pinhais, Brazil. Preventive Veterinary Medicine.

Baquero, O. S., Marconcin, S., Rocha, A., & Garcia, R. D. C. M. (2018). Companion animal demography and population management in Pinhais, Brazil. Preventive Veterinary Medicine.

Levy P and Lemeshow S (2008). Sampling of populations: methods and applications, Fourth edition. John Wiley and Sons, Inc.

\url{http://oswaldosantos.github.io/capm}
}
