library(Seurat)
library(ggplot2)

input_file <- "data/seurat_object.rds"
output_dir <- "results/single_cell_feature_plot"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

object <- readRDS(input_file)
genes <- c("KRT14", "KRT10", "COL1A1", "PTPRC")
reduction_name <- "umap"

p <- FeaturePlot(
  object,
  features = genes,
  reduction = reduction_name,
  pt.size = 0.25,
  ncol = 2
) &
  theme_classic(base_size = 10) &
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_line(linewidth = 0.4)
  )

ggsave(file.path(output_dir, "single_cell_feature_plot.pdf"), p, width = 6.2, height = 5.2)
ggsave(file.path(output_dir, "single_cell_feature_plot.png"), p, width = 6.2, height = 5.2, dpi = 600)
