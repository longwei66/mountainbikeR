% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/R6_get_segment_efforts.R
\name{get_segment_efforts}
\alias{get_segment_efforts}
\title{get_segment_efforts}
\usage{
get_segment_efforts(
  mbr_object = NULL,
  segment_id = NULL,
  page = NULL,
  per_page = NULL
)
}
\arguments{
\item{segment_id}{The identifier of the segment.}

\item{page}{Page number}

\item{per_page}{Number of items per page. Defaults to 30.}
}
\value{
my_streams as list with streams details
}
\description{
Returns a set of the authenticated athlete's segment efforts for a
given segment.
}
\examples{
\dontrun{
# my_mbr is a mountainbikeR object

my_mbr$get_segment_efforts(
     segment_id = 12345
     , page = 1
     , per_page = 15
)
}
}
\seealso{
\url{https://developers.strava.com/docs/reference/#api-SegmentEfforts-getEffortsBySegmentId}

\url{https://developers.strava.com/playground/#/SegmentEfforts/getEffortsBySegmentId}
}
