test_that("fit_model needs dataframe", {
  expect_error(fit_model(NA, degree=1))
})

test_that("fit_model needs dataframe", {
  df <- metabolic %>% dplyr::select(-"Temperature (C)")
  expect_error(fit_model(df, degree=1, temp_correct=TRUE),
               "Can't subset columns that don't exist.")
})

