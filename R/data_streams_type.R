#' Types of Strava Streams
#'
#' A dataset containing the various data streams available on strave api with
#' their type and units.
#'
#' Streams in strava are data points which are associated (streamed) to
#' activities. For Instance, time, altitude, heartrate (is sensor available),
#' temperature, etc...
#'
#' @format A data table with 11 items and 3 columns
#' \describe{
#'   \item{type}{Stream type}
#'   \item{datatype}{the type of data used by the Stream}
#'   \item{units}{the unit used by the strava stream}
#' }
#' @source \url{https://developers.strava.com/docs/reference/#api-Streams}
"stream_types"
