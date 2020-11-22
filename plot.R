require(ggplot2)
require(ggsci)

plot_results <- function(file = "results.csv",
                         which = "pool") {
  # Read data
  df <- read.csv(file, header=FALSE)
  names(df) <- c("benchmark", "system", "threads", "rep", "elapsed")
  df <- df[df$benchmark == which, ]

  # Ignore zeroeth repetition (includes precompilation time)
  df <- df[df$rep != 0, ]

  # Get mean elapsed time by condition
  df <- aggregate(list(elapsed=df$elapsed), by=list(benchmark=df$benchmark, system=df$system, threads=df$threads), FUN=mean)

  # Print for info
  print(df)

  # Plots
  levels(df$system) <- c("Core i5 laptop (2 cores)", "Xeon workstation (6 cores)")
  g <- ggplot(df, aes(x=threads, y=elapsed, color=system)) 
  g <- g + geom_line() + geom_point()
  g <- g + theme_minimal() + scale_color_d3(name="") + theme(panel.grid.minor=element_blank(), legend.position="top")
  g <- g + xlab("number of threads") + ylab("mean elapsed time (s)")
  g <- g + scale_x_continuous(breaks=1:12)
  g
}
