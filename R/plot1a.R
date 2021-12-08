plot1a <- function(df) {
  data_points = ggplot(df, aes(x=`Mass (g)`, y=`BMR (W)`)) + geom_point()
  linear = geom_line(aes(x=`Mass (g)`, y=linear_predict))
  data_points + linear
}
