extract_linestring_from_json <- function(feature_iterator,json){
  line_coords <- json$features[[feature_iterator]]$geometry$coordinates|>unlist()
  matrix <- matrix(line_coords,ncol = 2,byrow = TRUE)
  sf::st_linestring(matrix)
}
