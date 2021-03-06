% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/R6_get_activity.R
\name{get_activity}
\alias{get_activity}
\title{get_activity}
\usage{
get_activity(
  mbr_object = NULL,
  activity_id = NULL,
  include_all_efforts = FALSE
)
}
\arguments{
\item{mbr_object}{a mountainbiker object}

\item{activity_id}{the strava id of the activity}

\item{include_all_efforts}{boolean}
}
\value{
myActivity as list with activity details
}
\description{
Returns the given activity that is owned by the authenticated athlete.
https://developers.strava.com/playground/#/Activities/getActivityById
}
\examples{
\dontrun{
# my_mbr is a mountainbikeR object

my_mbr$get_activity(
     activity_id = 12345,
     include_all_efforts = TRUE
)
}
}
