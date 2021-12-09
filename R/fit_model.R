#' Fit data to linear or quadratic model
#'
#' @param df A dataframe containing species name, mass, metabolic rates, body temperature
#' @param degree An integer which is the degree of polynomial: 1 (default)
#' @param temp_correct A flag for temperature correction, TRUE or FALSE (default)
#' @param exclusion A list of species name to exclude
#' @return The coefficients for the fitted model

fit_model <- function(df, degree=1, temp_correct=FALSE, exclusion=list()) {
  df_sub <- subset(df, !df$Species %in% exclusion)
  if (temp_correct){
    df_sub %>% tidyr::drop_na(`Temperature (C)`)
    model <- lm(get("BMR (W)") ~ poly(get("Mass (g)"), degree=degree, raw=TRUE) + I(1/get("Temperature (C)")), data = df_sub)
  } else {
    model <- lm(get("BMR (W)") ~ poly(get("Mass (g)"), degree=degree, raw=TRUE), data = df_sub)
  }
  return(model)
}
