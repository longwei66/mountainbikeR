#' def_token
#'
#' @include R6class.R
#'
def_token <- function(){
    if(private$.connexion_status == TRUE){
        private$.token
    } else {
        stop("Token haven't been generated !", call. = FALSE)
    }
}
