#' Load raw data
#'
#' This turns the raw data Excel file into a dataframe.
#'
#' @param filename
#'
#' @return
#' @export
#' @examples
#' load_data("rawdata.xls")
load_data <- function(filename) {
  library("readxl")
  read_excel(filename)
}


