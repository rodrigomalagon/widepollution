parallel_unpivot <- function(raw_df,start_pattern1,start_pattern2,new_name1,new_name2,time_name,regex_group){
  df <- tidyr::pivot_longer(raw_df,
                            cols = starts_with(start_pattern1) | starts_with(start_pattern2),
                            names_to = c('.value',time_name),
                            names_pattern = regex_group
  )
  df <- rename_columns(df,c(start_pattern1,start_pattern2),c(new_name1,new_name2))
  return(df)
}
