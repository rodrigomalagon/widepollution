#' Rename the column names of a dataframe without calling any external library
#'
#' @param df A dataframe
#' @param old_colnames A **character vector** with the column names  of the data frame **to be changed**.
#' @param new_col_names A **character vector** with the new column names. Each element should match the corresponding **old name** in the `old_names` parameter.
#'
#' @return A dataframe of the same dimensions, with changed column names.
#' @export
#'
#' @examples
#' df <- data.frame(a=rep(1,5),b=rep(2,5),c=rep(3,5))
#' rename_columns(df,'a','first_column')
#' #
#' #
#' #' rename_columns(df,c('b','c'),c('second_column','third_column'))
rename_columns <- function(df,old_colnames,new_col_names){
  for (name in 1:length(old_colnames)){
    colnames(df)[colnames(df)==old_colnames[name]] <- new_col_names[name]
  }
  return(df)
}
