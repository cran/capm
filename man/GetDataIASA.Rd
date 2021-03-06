% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetDataIASA.R
\name{GetDataIASA}
\alias{GetDataIASA}
\title{Get initial values and paramters for IASA model from survey data}
\usage{
GetDataIASA(data = NULL, sex.col = "sex", female.label = "female",
  male.label = "male", sterilized.col = "sterilized",
  sterilized.label = "yes", sterilized.ly.col = "sterilized_ly",
  sterilized.ly.label = "yes", births.ly.col = "births_ly",
  species3.col = "species3", species.label = "dog",
  sex3.col = "sex2", fate.col = "fate", died.label = "died",
  lost.label = "lost", acquisition.col = "acquisition",
  acquired.ly.col = "acquired_ly", acquired.ly.label = "yes",
  adopted.label = "adopted", bought.label = "bought",
  acquisition.source.col = "acquisition_city",
  acquired.sterilized.col = "acquired_sterilized",
  destination.label = NULL, total.estimate = NULL, k1.scale = 5,
  h1 = 1, N2.scale = 0.05, f2.scale = 0.9, fs2.scale = 0.1,
  m2.scale = 0.95, ms2.scale = 0.05, b2.scale = 1.5,
  df2.scale = 1.2, dm2.scale = 1.2, sf2.scale = 0.3,
  sm2.scale = 0.3, k2.scale = 2, h2 = 0.5)
}
\arguments{
\item{data}{\code{\link{data.frame}} with survey data.}

\item{sex.col}{name or index of the column with the *sex* variable.}

\item{female.label}{string with the *female* category in \code{sex.col}.}

\item{male.label}{string with the *male* category in \code{sex.col}.}

\item{sterilized.col}{name or index of the column with the *sterilized* variable.}

\item{sterilized.label}{string with the *sterilized* category (ex. yes) in \code{sterilized.col}.}

\item{sterilized.ly.col}{name or index of the column with *sterilized last year* variable.}

\item{sterilized.ly.label}{string with the *sterilized during the last year* category (ex. yes) in \code{sterilized.ly.col}.}

\item{births.ly.col}{name or index of the column with the *births during the last year* variable.}

\item{species3.col}{name or index of the column with the *species* variable form the third questionnaire's section (animals that left the household).}

\item{species.label}{string with the *species* category of interest (ex. dog) in \code{species3.col}.}

\item{sex3.col}{name or index of the column with the *sex* variable form the third questionnaire's section (animals that left the household).}

\item{fate.col}{name or index of the column with the *fate* variable.}

\item{died.label}{string with the *died* category in \code{fate.col}.}

\item{lost.label}{string with the *lost* category in \code{fate.col}.}

\item{acquisition.col}{name or index of the column with the *acquisition* variable.}

\item{acquired.ly.col}{name or index of the column with the *acquisition during the last year* variable.}

\item{acquired.ly.label}{string with the *acquisition during the last year* category (ex. yes) in \code{acquisition.ly.col}.}

\item{adopted.label}{string with the *adopted* category in \code{acquistion.col}.}

\item{bought.label}{string with the *bought* category in \code{acquisition.col}.}

\item{acquisition.source.col}{name or index of the column with the *source* variable (ex. city).}

\item{acquired.sterilized.col}{name or index of the column with the *sterilized when acquired* variable.}

\item{destination.label}{string with the *destination* category (ex. city) in \code{acquisition.source.col}.}

\item{total.estimate}{number representing the estimated total population size.}

\item{k1.scale}{scale to define the carrying capacity of the owned population as k1 = k.scale * total.estimate.}

\item{h1}{number representing the mean harem size in the owned population.}

\item{N2.scale}{scale to define the unowned population size as N2 = N2.sclae * total.estimate.}

\item{f2.scale}{scale to define the female unowned population size as f2 = f2.scale * f1.}

\item{fs2.scale}{scale to define the sterilized female unowned population size as fs2 = fs2.scale * fs1.}

\item{m2.scale}{scale to define the sterimlized male unowned population as m2 = m2.scale * m1.}

\item{ms2.scale}{scale to define the sterilized male unowned population size as ms2 = ms2.scale * ms1.}

\item{b2.scale}{scale to define the birth function of the unowned population as b2 = f2 \* b1 / f1 \* b2.scale.}

\item{df2.scale}{scale to define the death rate of the female unowned population as df2 = df2.scale * df1.}

\item{dm2.scale}{scale to define the death rate of the male unowned population as dm2 = dm2.scale * dm1.}

\item{sf2.scale}{scale to define the sterilized female unowned population size as sf2 = sf2 = sf2.scale * sf1.}

\item{sm2.scale}{scale to define the sterilized male unowned population size as sm2 = sm2.scale * sm1.}

\item{k2.scale}{scale to define the carrying capacity of the unowned population as k2 = k2.scale * N2.}

\item{h2}{number representing the mean harem size in the unowned population.}
}
\value{
\code{\link{list}} with two vectors: \code{init} (initial values) and \code{pars} (parameters).
}
\description{
Calculates initial values and paramters for the IASA model, from survey data collectected with the questionnaire described by Bquero at al., 2018.
}
\details{
If column and category names in \code{data} match arguments' defaults, the function call is simplified as in the example below.
}
\examples{
data(dogs)
GetDataIASA(dogs, destination.label = "Pinhais", total.estimate = 50444)

}
\references{
Baquero, O. S., Marconcin, S., Rocha, A., & Garcia, R. D. C. M. (2018). Companion animal demography and population management in Pinhais, Brazil. Preventive Veterinary Medicine.

\url{http://oswaldosantos.github.io/capm}
}
