#' connect2strava
#'
#' Create authentication token with strava (based on web authentication)
#'
#' @param my_app_name chr string, the name of the app defined in strava
#' @param my_client_id chr string, the ID of the app like 27881
#' @param my_client_secret chr string, the secret as defined in strava
#' @param my_app_scope chr string for requested scopes, as a comma delimited
#' string, e.g. "activity:read_all,activity:write"
#'
#'
#' @return sig strava token
#' @export
#' @importFrom httr oauth_app oauth_endpoint oauth2.0_token
#'
#' @seealso \url{http://developers.strava.com/docs/authentication/}
#' @examples
#' \dontrun{
#' connect2strava(strava_key = "mykeyhere", strava_secret = "mysecrethere")
#' }
connect2strava <- function(
    my_app_name = NULL
    , my_client_id = NULL
    , my_client_secret = NULL
    , my_app_scope = "read,read_all,activity:read_all" #"public"
    , cache = FALSE
    ){

    # check inputs
    if(is.null(my_app_name)){ stop("my_app_name cannot be NULL")}
    if(is.null(my_client_id)){ stop("my_client_id cannot be NULL")}
    if(is.null(my_client_secret)){ stop("my_client_secret cannot be NULL")}
    if(is.null(my_app_scope)){ stop("my_app_scope cannot be NULL")}

    # declare the auth_app
    my_app <- httr::oauth_app(
        appname = my_app_name
        , key = my_client_id
        , secret = my_client_secret
        )

    # configure endpoint
    my_endpoint <- httr::oauth_endpoint(
        request = "https://www.strava.com/oauth/authorize?",
        authorize = "https://www.strava.com/oauth/authorize",
        access = "https://www.strava.com/oauth/token"
    )

    sig <- httr::oauth2.0_token(
        endpoint = my_endpoint
        , app = my_app
        , as_header = FALSE
        , scope = my_app_scope
        , cache = cache
        )
            # my_endpoint, my_app, scope = "view_private",
            #                     type = NULL, use_oob = FALSE, as_header = FALSE,
            #                     use_basic_auth = FALSE, cache = FALSE)
    return(sig)
}
