library(tidyverse)

input_file <- "data/heatmap.csv"
output_dir <- "results/heatmap"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

plot_data <- read_csv(input_file, show_col_types = FALSE) %>%
  mutate(
    Feature = factor(Feature, levels = rev(unique(Feature))),
    Sample = factor(Sample, levels = unique(Sample))
  )

p <- ggplot(plot_data, aes(x = Sample, y = Feature, fill = Value)) +
  geom_tile(color = "white", linewidth = 0.15) +
  scale_fill_gradient2(low = "#4C78A8", mid = "white", high = "#E45756") +
  labs(x = NULL, y = NULL, fill = "Value") +
  theme_minimal(base_size = 9) +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_text(angle = 45, hjust = 1, color = "black"),
    axis.text.y = element_text(color = "black"),
    legend.position = "right"
  )

ggsave(file.path(output_dir, "heatmap.pdf"), p, width = 5.2, height = 4.2)
ggsave(file.path(output_dir, "heatmap.png"), p, width = 5.2, height = 4.2, dpi = 600)

