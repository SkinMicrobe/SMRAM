library(Seurat)
library(ggplot2)

input_file <- "data/seurat_object.rds"
output_dir <- "results/single_cell_tsne_umap"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

object <- readRDS(input_file)
group_column <- "celltype"
reduction_name <- "tsne"

p <- DimPlot(
  object,
  reduction = reduction_name,
  group.by = group_column,
  label = TRUE,
  repel = TRUE,
  pt.size = 0.4
) +
  theme_classic(base_size = 10) +
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_line(linewidth = 0.4),
    legend.position = "right"
  )

ggsave(file.path(output_dir, "single_cell_tsne_umap.pdf"), p, width = 4.2, height = 3.6)
ggsave(file.path(output_dir, "single_cell_tsne_umap.png"), p, width = 4.2, height = 3.6, dpi = 600)
