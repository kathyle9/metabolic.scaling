#' Load raw data from paper
#'
#' This turns the raw data Excel file into a dataframe. Removes first 5 rows.
#' Log transforms Mass column and BMR column (dropping species with missing
#' values). Note: Some species may still have missing Temperature values.
#'
#' @param filename: path to raw data file
#'
#' @return dataframe with 4 columns: Species, Mass, BMR, Temperature
#' @export
#' @examples
#' load_data("rawdata.xls")
load_data <- function(filename) {
  df <- readxl::read_excel(filename, skip=5)
  df <- df[, c('Species','Mass (g)','BMR (W)','Temperature (C)')]
  df <- df %>% tidyr::drop_na(`Mass (g)`) %>% tidyr::drop_na(`BMR (W)`)
  df[,c('Mass (g)','BMR (W)')] <- log10(df[,c('Mass (g)','BMR (W)')])
  df

}


