% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/R6_initialize.R
\name{def_initialize}
\alias{def_initialize}
\title{def_initialize}
\usage{
def_initialize(
  my_app_name = NULL,
  my_client_id = NULL,
  my_client_secret = NULL,
  my_app_scope = "read,read_all,activity:read_all",
  cache = FALSE
)
}
\arguments{
\item{my_app_name}{chr string, the name of the app defined in strava}

\item{my_client_id}{chr string, the ID of the app like 27881}

\item{my_client_secret}{chr string, the secret as defined in strava}

\item{my_app_scope}{chr string for requested scopes, as a comma delimited}

\item{cache}{logical, TRUE to have local cache of the token, FALSE not
string, e.g. "activity:read_all,activity:write"}
}
\value{
sig strava token
}
\description{
Create authentication token with strava (based on web authentication)
}
\examples{
\dontrun{
connect2strava(strava_key = "mykeyhere", strava_secret = "mysecrethere")
}
}
\seealso{
\url{http://developers.strava.com/docs/authentication/}

\url{https://developers.strava.com/docs/authentication/#detailsaboutrequestingaccess}
}
