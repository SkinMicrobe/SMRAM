library(Seurat)
library(ggplot2)

input_file <- "data/seurat_object.rds"
output_dir <- "results/single_cell_violin_plot"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

object <- readRDS(input_file)
genes <- c("FABP5")
group_column <- "group"

p <- VlnPlot(
  object,
  features = genes,
  group.by = group_column,
  pt.size = 0,
  ncol = 1
) +
  theme_classic(base_size = 10) +
  theme(
    axis.text = element_text(color = "black"),
    axis.line = element_line(linewidth = 0.4),
    legend.position = "none"
  )

ggsave(file.path(output_dir, "single_cell_violin_plot.pdf"), p, width = 3.2, height = 3.2)
ggsave(file.path(output_dir, "single_cell_violin_plot.png"), p, width = 3.2, height = 3.2, dpi = 600)
