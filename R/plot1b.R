#' Plot1b
#'
#' Makes plot1b
#' @param x_range Range of input values in Mass (g)
#' @param linear_lm Linear model fitted to the data
#' @param quadratic_lm Quadratic model fitted to the data
#' @param hline Reference horizontal lines
#'
#' @return
#' @export
#'
#' @examples
#' plot1b(range_b, linear_lm_tempcorrect, quadratic_lm_tempcorrect)
plot1b <- function(x_range, linear_lm, quadratic_lm, hline=c(2/3, 3/4)){
  coefs <- quadratic_lm$coefficients
  data <- data.frame(logmass = x_range,
                     quadratic_slope = coefs[2] + 2*x_range*coefs[3])

  g <- ggplot(data, aes(x=logmass, y=quadratic_slope)) +
    geom_line() +
    geom_hline(yintercept = linear_lm$coefficients[2])
  g
}
