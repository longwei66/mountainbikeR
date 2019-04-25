#' makeStreamPath
#'
#' build the API url path
#'
#' @param activity.id the id of the activity
#' @param stream.type the type of the stream
#'
#' @return the full API path
#' @export
#'
#' @examples
makeStreamPath <- function(activity.id = NULL, stream.type = NULL){

    if(is.null(activity.id)){ stop("activity.id cannot be NULL")}
    if(is.null(stream.type)){ stop("stream.type cannot be NULL")}

    my.path = paste0("api/v3/activities/", activity.id, "/streams/", stream.type)
    return(my.path)
}
