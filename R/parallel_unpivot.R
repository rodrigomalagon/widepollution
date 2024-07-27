#' Simlutanously unpivot two variables running "parallel" across a wide-format data frame columns
#'
#' @param raw_df A dataframe in **wide format**
#' @param start_pattern1 **Character** identifying first variable
#' @param start_pattern2 **Character** identifying second variable
#' @param new_name1 New name for the column storing the values of the first variable
#' @param new_name2 New name for the column storing the values of the second variable
#' @param index_name New name for the column storing the **index** (usually time, e.g. hours, minutes) that **varies simultaneously** through both variables across the input dataframe's columns
#' @param regex_group Regular expression containing **matching groups** using parentheses, to split the input dataframe's columns into two parts: the identifying character for each of the two variable and the varying index.
#'
#' @return A data frame in long format with three new columns: one for the varying index and two for each of the "parallel" variables
#' @export
#'
#' @examples
#' df <- data.frame(a=1:5,
#'b=6:10,
#'X1=rep(1,5),
#'Y1=rep(10,5),
#'X2=rep(2,5),
#'Y2=rep(20,5),
#'X30=rep(3,5),
#'Y30=rep(30,5)
#')
#'
#'parallel_unpivot(df,'X','Y','X_series','Y_series','index','(X|Y)([[:digit:]]+)')

parallel_unpivot <- function(raw_df,start_pattern1,start_pattern2,new_name1,new_name2,index_name,regex_group){
  df <- tidyr::pivot_longer(raw_df,
                            cols = tidyr::starts_with(start_pattern1) | tidyr::starts_with(start_pattern2),
                            names_to = c('.value',index_name),
                            names_pattern = regex_group
  )
  df <- rename_columns(df,c(start_pattern1,start_pattern2),c(new_name1,new_name2))
  return(data.frame(df))#Ensuring class consistency with input
}
