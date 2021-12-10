## code to prepare `metabolic` dataset goes here
metabolic <- metabolic.scaling::load_data('analysis/data/raw_data/rawdata.xls')
usethis::use_data(metabolic, overwrite = TRUE)
