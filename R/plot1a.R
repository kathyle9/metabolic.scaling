plot1a <- function(df) {
  data_points = ggplot2::ggplot(df, ggplot2::aes(x=`Mass (g)`, y=`BMR (W)`)) + ggplot2::geom_point()
  linear = ggplot2::geom_line(ggplot2::aes(x=`Mass (g)`, y=linear_predict))
  data_points + linear
}
