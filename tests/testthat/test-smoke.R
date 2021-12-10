test_that("fit_model is lm class", {
  expect_s3_class(fit_model(metabolic, degree=1), "lm")
})

test_that("plot1a is gg class", {
  expect_s3_class(plot1a(metabolic), "gg")
})

