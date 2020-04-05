#'def_token
def_token <- function(){
    if(private$.connexion_statut == TRUE){
        private$.token
    }else{
        stop("Token haven't been generated !", call. = FALSE)
    }
}
