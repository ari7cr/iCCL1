#' iCCL1
#'
#' @param SeuratObject your Seurat Objeect
#' @param min.dim minimum dimension
#' @param max.dim maximum dimenson
#'
#'
#' @return cluster plots for dimesnion range between min.dim and max.dim
#' @export
#'
#' @examples
#' iCCL(mySeuratObject, 20, 25, "Macrophages")
iCCL <- function(SeuratObject, min.dim, max.dim){
  wd <- getwd()
  dir.create("iCCL_results")
  dim.list = min.dim:max.dim
  resol = c(0.25, 0.50, 0.75, 1)

  #Preprocessing, Scaling, PCA
  #input <- Seurat::FindVariableFeatures(SeuratObject, selection.method = "vst", nfeatures = 2000)
  #all.genes <- rownames(input)
  #input <- Seurat::ScaleData(input, features = all.genes)
  #input <- Seurat::RunPCA(input, features = VariableFeatures(object = input))


  for(i in dim.list){
    dimens <- Seurat::FindNeighbors(SeuratObject, dims = 1:i)
    for(r in resol){
      clust <- Seurat::FindClusters(dimens, resolution = r)
      clust <- Seurat::RunUMAP(clust, dims = 1:i)
      nam <- paste("Dim_", i, "_Res_", r, sep = "")
      print(nam)
      assign(nam, clust)
      pl <- Seurat::DimPlot(clust, label = 1, repel = 1) + ggplot2::ggtitle(nam) # +NoLegend()
      mypath <- file.path(wd, projectname, paste(nam, ".png", sep = ""))
      png(file=mypath)
      print(pl)
      dev.off()
    }
  }


}
