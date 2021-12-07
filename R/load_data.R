#' Load raw data
#'
#' This turns the raw data Excel file into a dataframe. Removes first 5 rows.
#' Log transforms Mass column and BMR column
#'
#' @param filename: path to raw data file
#'
#' @return dataframe with 4 columns: Specia, Mass, BMR, Temperature
#' @export
#' @examples
#' load_data("rawdata.xls")
load_data <- function(filename) {
  df <- readxl::read_excel(filename, skip=5)
  df <- df[, c(4,7,8,10)]
  df <- na.omit(df)
  df[,c(2,3)] <- log(df[,c(2,3)])
  df

}


