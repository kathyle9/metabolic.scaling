plot1b <- function(x_range, linear_lm, quadratic_lm, hline=c(2/3, 3/4)){
  coefs <- quadratic_lm$coefficients
  coefs <- coefs[which(grepl("Mass", names(coefs)))]
  data <- data.frame(logmass = x_range,
                     quadratic_slope = coefs[1] + x_range*coefs[2])

  g <- ggplot2::ggplot(data, ggplot2::aes(x=logmass, y=quadratic_slope)) +
    ggplot2::geom_line() +
    ggplot2::geom_hline(yintercept = linear_lm$coefficients[2])
  g
}
