#' Title
#'
#' @param SeuratObject
#'
#' @return
#' @export
#'
#' @examples predictdimension(Macs)
predictdimension <- function(SeuratObject){


  # Determine percent of variation associated with each PC
  pct <- SeuratObject[["pca"]]@stdev / sum(SeuratObject[["pca"]]@stdev) * 100

  # Calculate cumulative percents for each PC
  cumu <- cumsum(pct)

  # Determine which PC exhibits cumulative percent greater than 90% and % variation associated with the PC as less than 5
  co1 <- which(cumu > 90 & pct < 5)[1]
  #co1

  # Determine the difference between variation of PC and subsequent PC
  co2 <- sort(which((pct[1:length(pct) - 1] - pct[2:length(pct)]) > 0.1), decreasing = T)[1] + 1

  # last point where change of % of variation is more than 0.1%.
  #co2

  # proceed with Minimum of the two calculation
  pcs <- min(co1, co2)
  #pcs

  # Create a dataframe with values
  plot_df <- data.frame(pct = pct,
                        cumu = cumu,
                        rank = 1:length(pct))

  # Elbow plot to visualize
  prediction <-   ggplot2::ggplot(plot_df, aes(cumu, pct, label = rank, color = rank > pcs)) +
                   geom_text() +
                   geom_vline(xintercept = 90, color = "grey") +
                   geom_hline(yintercept = min(pct[pct > 5]), color = "grey") +
                   theme_bw() + ggplot2::ggtitle("prediction: ", pcs)
  plot(prediction)


}
