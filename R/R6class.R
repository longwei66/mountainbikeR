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

        },

        #' @description
        #' List all activities from strava api. Returns the activities of an athlete
        #' for a specific identifier. Requires activity:read.
        #' Only Me activities will be filtered out unless requested by a token
        #' with activity:read_all.
        #'
        #' @param activities_per_page max number of item to return (must be 200 max)
        #' @param page_number the specific page number to extract
        #' @param after_date return activities after date as YYYY-MM-DD
        #' @param before_date return activities before date as YYYY-MM-DD
        get_activities = function(
            activities_per_page = 200
            , page_number = 1
            , after_date = NULL
            , before_date = NULL
        ){
            environment(def_get_activities) <- environment()
            def_get_activities(
                activities_per_page = activities_per_page
                , page_number = page_number
                , after_date = after_date
                , before_date = before_date
            )
        },


        #' @description
        #' Returns the given activity that is owned by the authenticated athlete.
        #' https://developers.strava.com/playground/#/Activities/getActivityById
        #'
        #' @param activity_id the strava id of the activity
        #' @param include_all_efforts boolean
        get_activity = function(
            activity_id = NULL
            , include_all_efforts = FALSE
        ){
            environment(def_get_activity) <- environment()
            def_get_activity(
                activity_id = activity_id
                , include_all_efforts = include_all_efforts
            )
        },



        #' @description
        #' Get athlete gear description from gear id
        #' @param gear_id the id of the gear to get
        get_gear = function(
            gear_id = NULL
        ){

            environment(def_get_gear) <- environment()
            def_get_gear(gear_id = gear_id)
        }
    ),
    lock_objects = FALSE
)

