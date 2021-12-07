#' Load raw data
#'
#' This turns the raw data Excel file into a dataframe. Removes first 5 rows.
#'
#' @param filename: path to raw data file
#'
#' @return dataframe with 4 columns
#' @export
#' @examples
#' load_data("rawdata.xls")
load_data <- function(filename) {
  df <- readxl::read_excel(filename, skip=5)
  df <- df[, c(4,7,8,10)]
  df
}


