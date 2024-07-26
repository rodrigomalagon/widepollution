rename_columns <- function(df,old_colnames,new_col_names){
  for (name in 1:length(old_colnames)){
    colnames(df)[colnames(df)==old_colnames[name]] <- new_col_names[name]
  }
  return(df)
}
