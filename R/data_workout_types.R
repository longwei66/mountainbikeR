#' Availabe workouts in strava API
#'
#' Strava activities are associated with a code, describing the type of workout
#' realised during the activity. This dataset contains the mappin between the
#' workout types id and their description in plain english.
#'
#' @format A data frame with 8 rows and 2 variables:
#' \describe{
#'   \item{workout_type_id}{the id of the workout type: 11, 10, ...}
#'   \item{workout_type}{the workout type in plain english : "Ride.Relax",
#'    "Ride.Race"}
#' }
#' @source
#'  \url{https://developers.strava.com/docs/reference/}
"workout_types"
