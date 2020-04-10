#' Availabe streams in strava API
#'
#' While doing an activity strava is recording streaming data points of various
#' types. This dataset defines the available streams in the strava API
#'
#' @format A data frame with 11 rows and 3 variables:
#' \describe{
#'   \item{type}{offical name of the stream, e.g. time, latlng, distance, ...}
#'   \item{datatype}{type of data for the stream : integer, floats, ...}
#'   \item{units}{unit associated with the stream : e.g. seconds, meters, ....}
#' }
#' @source
#'  \url{https://developers.strava.com/docs/reference/#api-models-StreamSet}
"stream_types"
