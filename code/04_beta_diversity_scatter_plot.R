library(tidyverse)

input_file <- "data/beta_diversity_scatter_plot.csv"
output_dir <- "results/beta_diversity_scatter_plot"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

plot_data <- read_csv(input_file, show_col_types = FALSE) %>%
  mutate(Group = factor(Group, levels = unique(Group)))

p <- ggplot(plot_data, aes(x = PC1, y = PC2, color = Group, fill = Group)) +
  geom_point(size = 1.8, alpha = 0.75) +
  stat_ellipse(geom = "polygon", alpha = 0.12, color = NA) +
  stat_ellipse(linewidth = 0.45) +
  labs(x = "PC1", y = "PC2", color = NULL, fill = NULL) +
  theme_classic(base_size = 10) +
  theme(
    axis.text = element_text(color = "black"),
    axis.line = element_line(linewidth = 0.4),
    legend.key.size = unit(3.2, "mm"),
    legend.position = "right"
  )

ggsave(file.path(output_dir, "beta_diversity_scatter_plot.pdf"), p, width = 3.8, height = 3.4)
ggsave(file.path(output_dir, "beta_diversity_scatter_plot.png"), p, width = 3.8, height = 3.4, dpi = 600)

