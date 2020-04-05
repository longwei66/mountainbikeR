#' extractPath
#'
#' a function to extract a path from a polyline coded GPS track which returns
#' a data.table
#'
#' @param polyline a polyline as per google algo
#' @param id the associated id of the polyline (the segment or strava activity id)
#' @param date_time the YYYY-MM-DD date
#'
#' @importFrom anytime anydate
#' @return a data.frame with lon, lat, point_id, id, date as column
#' @export
#' @include decodePolyline.R
#'
#' @seealso \url{https://developers.google.com/maps/documentation/utilities/polylinealgorithm}
#' @examples
#' \dontrun{
#' extractPath(
#'       polyline = myPolyline,
#'       id = 123456
#'       date_time = "2018-01-12"
#' )
#' }
extractPath <- function(polyline = NULL,
                    id = NULL,
                    date_time = NULL){

    r <- mountainbikeR::decodePolyline(polyline)
    r$id <- id
    r$coord_id <- 1:nrow(r)
    r$date <- anytime::anydate(date_time)
    return(data.table::as.data.table(r))
}
