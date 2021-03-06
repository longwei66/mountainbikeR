% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/R6_get_activity_streams.R
\name{get_activity_streams}
\alias{get_activity_streams}
\title{get_activity_streams}
\usage{
get_activity_streams(
  mbr_object = NULL,
  activity_id = NULL,
  streams_types = NULL
)
}
\arguments{
\item{mbr_object}{a mountainbiker object}

\item{activity_id}{the strava id of the activity}

\item{streams_types}{vector of esired stream types. May take the
following values:
"time", "latlng", "distance", "altitude", "velocity_smooth",
"heartrate", "cadence", "watts", "temp", "moving", "grade_smooth"}
}
\value{
my_streams as list with streams details
}
\description{
Returns the specified segment. read_all scope required in order to
retrieve athlete-specific segment information, or to retrieve private
segments.
}
\examples{
\dontrun{
# my_mbr is a mountainbikeR object

my_mbr$get_activity_streams(
     activity_id = 12345
     , streams_types = c("heartrate","distance")
)
}
}
\seealso{
\url{https://developers.strava.com/docs/reference/#api-Segments-getSegmentById}
}
