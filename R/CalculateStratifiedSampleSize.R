#' Stratified random sample size
#' @description Calculates sample size to estimate a total from a stratified random sampling design.
#' @param strata \code{\link{vector}}, \code{\link{matrix}} or \code{\link{data.frame}}. If vector, named elements represent the size of the strata. If matrix or data.frame, first column represent the size of each strata, second column represent the expected mean in each strata and third column represent the expected variance in each strata. Each row is a strata and must be named.
#' @param x \code{\link{data.frame}} representing a pilot sample. First column has the variable to be estimated and second column has the strata membership of each observation. Needed when \code{strata} is a vector.
#' @param conf.level the confidence level required. It must be \code{\link{numeric}} between 0 and 1 inclusive.
#' @param error the maximum relative difference between the estimate and the unknown population value. It must be \code{\link{numeric}} between 0 and 1 inclusive.
#' @return numeric sample size rounded up to nearest integer.
#' @references Levy P and Lemeshow S (2008). Sampling of populations: methods and applications, Fourth edition. John Wiley and Sons, Inc.
#' 
#' \url{http://oswaldosantos.github.io/capm}
#' @export
#' @examples 
#' # Using a pilot sample from a population with 10000 sampling units.
#' strata <- rep(c("rural", "urban"), c(100, 9900))
#' pilot <- data.frame(c(rpois(5, 1.3), rpois(45, 0.8)),
#'                            rep(c("rural", "urban"), c(5, 45)))
#' CalculateStratifiedSampleSize(strata, pilot)
#'       
#' # Using expected mean and variance for a population with
#' # 10000 sampling units.
#' str_n <- c(rural = 100, urban = 9900)
#' str_mean <- c(rural = 1.4, urban = 0.98)
#' str_var <- c(rural = 1.48, urban = 1.02)
#' CalculateStratifiedSampleSize(cbind(str_n, str_mean, str_var))
#' 
CalculateStratifiedSampleSize <- function(strata = NULL, x = NULL, conf.level = 0.95, error = 0.1) {
  if(any(class(strata) == "data.frame")) {
    strata <- as.data.frame(strata)
  }
  if(!is.null(x)) {
    x <- as.data.frame(x) 
  }
  if (conf.level > 1 | conf.level < 0) {
    stop('conf.level must be a number between 0 and 1 inclusive.')
  }
  if (error > 1 | error < 0) {
    stop('error must be a number between 0 and 1 inclusive.')
  }
  if ((is.matrix(strata) | is.data.frame(strata)) &
        is.null(rownames(strata))) {
    stop('each strata must have a name.')
  }
  if (is.vector(strata)) {
    Ni <- c(table(strata))
    N <- length(strata)
    mean.i <- tapply(x[ , 1], x[ , 2], mean)
    var.i <- tapply(x[ , 1], x[ , 2], var)
  } else {
    Ni <- strata[ , 1]
    N <- sum(Ni)
    mean.i <- strata[ , 2]
    var.i <- strata[ , 3]
  }
  z <- qnorm(1 - ((1 - conf.level) / 2), 0, 1)
  sample.mean <- sum(Ni * mean.i) / N
  sigma.b <- sum(Ni * (mean.i - sample.mean)^2) / N
  sigma.w <- sum(Ni * var.i) / N
  sigma <- sigma.b + sigma.w
  V <- sigma / sample.mean^2
  gamma <- sigma.b / sigma.w
  n <- (z^2 * N / (1 + gamma) * V) /
    (z^2 * V / (1 + gamma) + N * error^2)
  ni <- ceiling(n * Ni / N)
  sample.sizes <- c()
  for (i in 1:length(ni)) {
    sample.sizes[i] <- paste('Sample size in', names(ni)[i], 'strata:')
  }
  names(ni) <- sample.sizes
  return(cbind(Value = c(ni,
                         "Total sample size" = sum(ni),
                         "Mean" = sample.mean,
                         "Total variance (V)" = sigma,
                         "Variance between strata (V1)" = sigma.b,
                         "Variance within strata (V2)" = sigma.w,
                         "Relative variance (V / Mean)" = V,
                         "gamma (V1/V2)" = gamma)))
}
