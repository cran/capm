#' Household data from a two-stage cluster sample
#'
#' Household hypothetical data from a two-stage cluster sample.
#'
#' @format A data frame with 1770 observations and 19 variables:
#' \describe{
#'   \item{track_id}{Census track's ID from Santos, Brazil.}
#'   \item{hh_id}{Household's ID.}
#'   \item{interviewer}{Interviewer's name.}
#'   \item{date}{Interview date.}
#'   \item{address}{Household's address.}
#'   \item{interview}{Interview status.}
#'   \item{interviewee}{Interviewee's name.}
#'   \item{persons}{Number of persons.}
#'   \item{dogs}{Number of dogs.}
#'   \item{cats}{Number of cats.}
#'   \item{phone}{Interviewee's phone.}
#'   \item{email}{Interviewee's e-mail.}
#'   \item{reasons_to_not_sterilize}{Reasons the interviewee has to not sterilize her/his animal.}
#'   #'   \item{reasons_to_not_sterilize_others}{Other reasons the interviewee has to not sterilize her/his animal.}
#'   \item{common_fates}{Most common fate of animals among selected options, according to the interviewee.}
#'   #'   \item{common_fates_others}{Other options for the most common fate of animals, according to the interviewee.}
#'   \item{tolerance}{Responses of owners when their animals destroy an expensive thing, according to the interviewee.}
#'   \item{tolerance_others}{Other  responses of owners when their animals destroy an expensive thing, according to the interviewee.}
#'   \item{reasons_to_abandom}{Reasons that would lead the interviewees to abandom their animals.}
#' }
"cluster_sample"