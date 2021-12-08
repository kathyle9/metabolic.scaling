#' Predict based on fitted model
#'
#' @param mass_range A vector of log10(Mass(g)) for which to predict log10(B(W))
#' @param model Fitted lm model
#' @return The predicted log10(B(W))

model_prediction <- function(mass_range, model) {
  coefs <- model$coefficients
  coef_index <- max(which(grepl("Mass", names(coefs))))
  coefs <- coefs[1:coef_index]
  coefs[1] + rowSums(poly(mass_range, degree=coef_index-1)*coefs[2:coef_index])
}
