#' mountainbikeR
#'
#' A package for mountainbikers who use strava to log their rides and want to
#' explore and visualise their rides data.This package combines several tools :
#'
#' @section Access to Strava API :
#' a set of functions to get your personnal data from strava api, your
#' activites, gear, segments
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
#' @seealso \code{\link{mountainbiker_initializer}}
#' @seealso \code{\link{get_activities}}
#' @seealso \code{\link{get_gear}}
#'
#' @docType package
#' @name mountainbikeR
NULL
