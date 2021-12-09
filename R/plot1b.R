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

  g <- ggplot(data, aes(x = logmass,
                        y = quadratic_slope)) +
    geom_line(aes(color = "Quadratic")) +
    geom_hline(aes(color="Power law"), yintercept = linear_lm$coefficients[2],
               color = 'red') +
    geom_hline(yintercept = hline, aes(color = '2/3 and 3/4')) +
    labs(y="Slope", x=expression(paste("log"[10], "[M (g)]"))) +
    theme_bw() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          legend.position = c(0,1),
          legend.justification = c(0,1),
          legend.background = element_rect(fill=NA),
          legend.title = element_blank()) +
    scale_color_manual(values = c('2/3 and 3/4' = 'black',
                                'Power law' = 'red',
                                'Quadratic' = 'blue')) +
    coord_cartesian(expand = FALSE) +
    scale_y_continuous(breaks = seq(round(min(data$quadratic_slope), digits = -2),
                                    max(data$quadratic_slope),
                                    0.05))

  g
}
