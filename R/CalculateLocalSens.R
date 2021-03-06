#' Local sensitivity analysis
#' @description Wraper for \code{\link{sensFun}} function, which estimates local effect of all model parameters on population size, applying the so-called sensitivity functions. The set of parameters used in any of the following functions can be assessed: \code{\link{SolveIASA}}, \code{\link{SolveSI}} or \code{\link{SolveTC}}.
#' @param model.out output from one of the previous functions or a \code{\link{list}} with equivalent structure.
#' @param sensv string with the name of the output variables for which sensitivity are to be estimated.
#' @details For further arguments of \code{\link{sensFun}}, defaults are used. See the help page of this function for details. Methods for class "sensFun" can be used.
#' @return a \code{\link{data.frame}} of class \code{\link{sensFun}} containing the sensitivity functions. There is one row for each sensitivity variable at each independent time. The first column \code{x}, contains the time value; the second column \code{var}, the name of the observed variable; and remaining columns have the sensitivity parameters.
#' @references Soetaert K and Petzoldt T (2010). Inverse modelling, sensitivity and monte carlo analysis in R using package FME. Journal of Statistical Software, 33(3), pp. 1-28.
#' 
#' Reichert P and Kfinsch HR (2001). Practical identifiability analysis of large environmental simulation models. Water Resources Research, 37(4), pp.1015-1030.
#' 
#' Baquero, O. S., Marconcin, S., Rocha, A., & Garcia, R. D. C. M. (2018). Companion animal demography and population management in Pinhais, Brazil. Preventive Veterinary Medicine.
#' 
#' \url{http://oswaldosantos.github.io/capm}
#' @seealso \code{\link{sensRange}}.
#' @export
#' @examples 
#' ## IASA model
#' 
#' ## Parameters and intial conditions.
#' data(dogs)
#' dogs_iasa <- GetDataIASA(dogs,
#'                          destination.label = "Pinhais",
#'                          total.estimate = 50444)
#' 
#' # Solve for point estimates.
#' solve_iasa_pt <- SolveIASA(pars = dogs_iasa$pars,
#'                           init = dogs_iasa$init,
#'                           time = 0:15,
#'                           alpha.owned = TRUE,
#'                           method = 'rk4')
#' 
#' ## Calculate local sensitivities to all parameters.
#' local_solve_iasa2 <- CalculateLocalSens(
#'   model.out = solve_iasa_pt, sensv = "n2")
#' local_solve_iasa1 <- CalculateLocalSens(
#'   model.out = solve_iasa_pt, sensv = "n1")
#' 
CalculateLocalSens <- function(model.out = NULL, sensv = 'n') {
  if (length(intersect(sensv, names(model.out$init))) == 0) {
    stop('All variables in sensv must be\ncontained in "init" argument  of model.out.')
  }
  sensFun(func = model.out$model, 
          parms = model.out$pars, 
          init = model.out$init,
          time = model.out$time,
          sensvar = sensv,
          varscale = 1)
}