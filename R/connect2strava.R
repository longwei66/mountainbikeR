#' connect2strava
#'
#' Create authentication token with strava (based on web authentication)
#'
#' @param strava_key strava key
#' @param strava_secret strave secret
#'
#' @return sig strava token
#' @export
#' @importFrom httr oauth_app oauth_endpoint oauth2.0_token
#'
#' @seealso \url{https://www.strava.com/settings/api}
#' @examples
#' \dontrun{
#' connect2strava(strava_key = "mykeyhere", strava_secret = "mysecrethere")
#' }
connect2strava <- function(strava_key = NULL, strava_secret = NULL){

    # check inputs
    if(is.null(strava_key)){ stop("strava_key cannot be NULL")}
    if(is.null(strava_secret)){ stop("strava_secret cannot be NULL")}

    # declare the auth_app
    my_app <- httr::oauth_app("strava",
                              key = strava_key,
                              secret = strava_secret)

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
