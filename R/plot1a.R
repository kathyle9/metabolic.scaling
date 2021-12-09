#' Plot1a
#'
#' Makes plot1a
#' @param df The dataframe with columns for Mass and BMR
#'
#' @return ggplot
#' @export
plot1a <- function(df) {
  data_points = ggplot(df, aes(x=`Mass (g)`, y=`BMR (W)`)) + geom_point(size = 0.5)
  linear = geom_line(aes(x=`Mass (g)`, y=linear_predict), color='red3')
  quadratic = geom_line(aes(x=`Mass (g)`, y=quadratic_predict), color='blue3')
  data_points + linear + quadratic + xlab('Log10[M (g)]') + ylab('Log10[BMR (W)]')
}
