#' connect2strava
#'
#' Create authentication token with strave (based on web)
#'
#' @param strava.key strava key
#' @param strava.secret strave secret
#'
#' @return sig strava token
#' @export
#' @import httr
#'
#' @seealso https://www.strava.com/settings/api
#' @examples
#' \dontrun{
#' connect2strava(strava.keu = "mykeyhere", strava.secret = "mysecrethere")
#' }
connect2strava <- function(strava.key = NULL, strava.secret = NULL){

    # check inputs
    if(is.null(strava.key)){ stop("strava.key cannot be NULL")}
    if(is.null(strava.secret)){ stop("strava.secret cannot be NULL")}

    # declare the auth_app
    my_app <- httr::oauth_app("strava", key = myId, secret = mySecret)

    # configure endpoint
    my_endpoint <- httr::oauth_endpoint(
        request = NULL,
        authorize = "https://www.strava.com/oauth/authorize",
        access = "https://www.strava.com/oauth/token"
    )

    sig <- httr::oauth2.0_token(my_endpoint, my_app, scope = "view_private",
                                type = NULL, use_oob = FALSE, as_header = FALSE,
                                use_basic_auth = FALSE, cache = FALSE)
    return(sig)
}
