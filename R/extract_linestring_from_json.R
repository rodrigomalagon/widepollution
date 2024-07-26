#' Extract linestring geometry from list with a json structure
#'
#' @param feature_iterator An integer indexing the feature element to extract
#' @param json_list A list with json structure containing linestring coordinates
#'
#' @return An sf linestring object
#' @export
#'
#' @examples
#'
#' json_list <- list(
#' features=list(
#' list(
#'  geometry = list(
#'    coordinates =list(
#'      c(0,0),c(0,1),c(1,1),c(1,0),c(0,0)
#'    )
#'  )
#' ),
#'   list(
#'  geometry = list(
#'    coordinates =list(
#'      c(0,0),c(0,3),c(3,0),c(0,0)
#'    )
#'  )
#' ),
#' list(
#'  geometry = list(
#'    coordinates =list(
#'      c(-1,0),c(1,0),c(1,1),c(0,2),c(-1,1),c(-1,0)
#'    )
#'  )
#' )
#' )
#'  )
#'
#'  extract_linestring_from_json_list(3,json_list)

extract_linestring_from_json_list <- function(feature_iterator,json_list){
  line_coords <- json_list$features[[feature_iterator]]$geometry$coordinates|>unlist()
  matrix <- matrix(line_coords,ncol = 2,byrow = TRUE)
  sf::st_linestring(matrix)
}
