#' Plot1a
#'
#' Makes plot1a
#' @param df The dataframe with columns for Mass and BMR
#'
#' @return ggplot
#' @export
plot1a <- function(df) {
  data_points = ggplot(df, aes(x=`Mass (g)`, y=`BMR (W)`)) + geom_point(size = 0.5)
  linear = geom_line(aes(x=`Mass (g)`, y=linear_predict, color='linear'))
  quadratic = geom_line(aes(x=`Mass (g)`, y=quadratic_predict, color='quadratic'))
  orca_point = geom_point(aes(color='Orca'), data = df[which.max(df$`Mass (g)`), ], size=1, shape=15)
  data_points + linear + quadratic + orca_point + xlab(expression(paste("log"[10]," M (g)"))) + ylab(expression(paste("log"[10]," BMR (W)"))) +
    scale_color_manual(values = c('Orca'='green3', 'linear'='red2', 'quadratic'='blue2'),
                       guide = guide_legend(override.aes = list(linetype = c(1,0,1)))) +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          legend.position = c(0,1), legend.justification = c(0,1),
          legend.background = element_rect(fill=NA)) +
    theme(legend.title = element_blank())
}
