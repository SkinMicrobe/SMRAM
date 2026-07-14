library(Seurat)
library(ggplot2)

input_file <- "data/seurat_object.rds"
output_dir <- "results/single_cell_dot_plot"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

object <- readRDS(input_file)
genes <- c("KRT14", "KRT10", "COL1A1", "PECAM1", "PTPRC")
group_column <- "celltype"

p <- DotPlot(
  object,
  features = genes,
  group.by = group_column
) +
  coord_flip() +
  scale_color_gradient(low = "#D9D9D9", high = "#E45756") +
  labs(x = NULL, y = NULL, color = "Average expression", size = "Percent expressed") +
  theme_classic(base_size = 10) +
  theme(
    axis.text = element_text(color = "black"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.line = element_line(linewidth = 0.4),
    legend.position = "right"
  )

ggsave(file.path(output_dir, "single_cell_dot_plot.pdf"), p, width = 5.2, height = 3.8)
ggsave(file.path(output_dir, "single_cell_dot_plot.png"), p, width = 5.2, height = 3.8, dpi = 600)
