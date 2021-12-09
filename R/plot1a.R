plot1a <- function(df) {
  data_points = ggplot2::ggplot(df, ggplot2::aes(x=`Mass (g)`, y=`BMR (W)`)) + ggplot2::geom_point(size = 0.5)
  linear = ggplot2::geom_line(ggplot2::aes(x=`Mass (g)`, y=linear_predict, color = "red"))
  quadratic = ggplot2::geom_line(ggplot2::aes(x=`Mass (g)`, y=quadratic_predict, color = "blue"))
  data_points + linear + quadratic + ggplot2::xlab('Log10[M (g)]') + ggplot2::ylab('Log10[BMR (W)]')
}
