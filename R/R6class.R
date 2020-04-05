#' R6 Class for a strava application with authorization
#'
#' @description
#' This strava class is designed to interract with strava API using
#' a set of methods.
#' A mountainbikeR object must be initialized using the new method then
#' all other method will be availabe
#'
#' @details
#' TBD
#' @importFrom R6 R6Class
#' @export

mountainbiker_initializer <- R6::R6Class(
    "strava_authentication_setup",

    #inherits=
    private = list(
        .client_id = NULL
        , .client_secret = NULL
        , .url_request = "https://www.strava.com/oauth/authorize?"
        , .url_authorize = "https://www.strava.com/oauth/authorize"
        , .url_access = "https://www.strava.com/oauth/token"




    ),
    active = list(
        #' @field token Shows generated token.
        token = function(){

            environment(def_token) <- environment()
            def_token()
        }
    ),
    public = list(
        #' @description
        #' Create a new moutainbiker object.
        #'
        #' @param my_app_name chr string, the name of the app defined in strava
        #' @param my_client_id chr string, the ID of the app like 27881
        #' @param my_client_secret chr string, the secret as defined in strava
        #' @param my_app_scope chr string for requested scopes, as a comma delimited
        #' @param cache a logical TRUE to keep cached token, false for not.
        #' string, e.g. "activity:read_all,activity:write"
        #'
        #' @return A new `mountainbikeR object` object.
        #'
        #' @examples
        #' \dontrun{
        #' my_mb <- mountainbiker_initializer$new(
        #'     my_app_name = "mycool_app"
        #'     , my_client_id = 77777
        #'     , my_client_secret = "a super secret string"
        #'     , my_app_scope = "read,read_all,activity:read_all" #"public"
        #'     , cache = FALSE
        #'     )
        #' }
        initialize = function(
            my_app_name = NULL
            , my_client_id = NULL
            , my_client_secret = NULL
            , my_app_scope = "read,read_all,activity:read_all" #"public"
            , cache = FALSE
            ){

            environment(def_initialize) <- environment()
            def_initialize(
                my_app_name
                , my_client_id
                , my_client_secret
                , my_app_scope
                , cache
                )

        }
    ),
    lock_objects = FALSE
)

