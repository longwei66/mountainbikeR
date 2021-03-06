#' mountainbikeR
#'
#' A package for mountainbikers who use strava to log their rides and want to
#' explore and visualise their rides data.This package combines several tools :
#'
#' @section Access to Strava API :
#' a set of functions to get your personnal data from strava api, your
#' activites, gear, segments
#'
#' 0. Authentication
#' \itemize{
#'   \item \code{\link{mountainbiker_initializer}} to connect to strave api with key an secret
#' }
#' 1.  Activities
#' \itemize{
#'   \item \code{\link{get_activities}}
#'   \item \code{\link{get_activity}}
#'   \item \code{\link{get_activity_zones}}
#' }
#' 2.  Athletes
#' \itemize{
#'   \item \code{\link{get_athele}}
#'   \item \code{\link{get_athele_stats}}
#'   \item \code{\link{get_athele_zones}}
#' }
#' 3.  Clubs
#' 4.  Gears
#' \itemize{
#'   \item \code{\link{get_gear}}
#' }
#'
#' 5.  Routes
#'
#' 6.  RunningRaces
#'
#' 7.  SegmentEfforts
#' \itemize{
#'    \item \code{\link{get_segment_efforts}}
#'    \item \code{\link{get_segment_effort}}
#' }
#'
#' 8.  Segments
#' \itemize{
#'   \item \code{\link{explore_segments}}
#'   \item \code{\link{get_segment_leaderboard}}
#'   \item \code{\link{get_starred_segments}}
#'   \item \code{\link{get_segment}}
#' }
#'
#' 9.  Streams
#' \itemize{
#'   \item \code{\link{get_activity_streams}}
#'   \item \code{\link{get_segment_effort_streams}}
#'   \item \code{\link{get_segment_streams}}
#' }
#' 10. Uploads
#'
#' @section Data visualisation functions :
#' a set of functions to visualise your activities and segment data, plots,
#' maps, etc...
#' @section mountainbikeR shiny app :
#' a shiny app packaging data and visualisation
#' @section singletrackeR model :
#' a plumber api integrating a trained machine learning model to predict if a
#' given segment is a single track and all the necessary code to retrain the
#' model with your own data.
#' A set of function to explore a defined geographical area, and especially find
#' single track segments
#'
#' @section Main functions

#' @seealso \url{https://developers.strava.com/docs/reference/}
#'
#' @docType package
#' @name mountainbikeR
NULL
