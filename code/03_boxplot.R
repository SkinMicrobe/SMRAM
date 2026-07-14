library(tidyverse)

input_file <- "data/boxplot.csv"
output_dir <- "results/boxplot"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

plot_data <- read_csv(input_file, show_col_types = FALSE) %>%
  mutate(Group = factor(Group, levels = unique(Group)))

p <- ggplot(plot_data, aes(x = Group, y = Value, fill = Group)) +
  geom_boxplot(width = 0.55, outlier.shape = NA, linewidth = 0.35, alpha = 0.75) +
  geom_jitter(width = 0.12, size = 1.2, alpha = 0.65) +
  labs(x = NULL, y = "Value") +
  theme_classic(base_size = 10) +
  theme(
    axis.text = element_text(color = "black"),
    axis.line = element_line(linewidth = 0.4),
    legend.position = "none"
  )

ggsave(file.path(output_dir, "boxplot.pdf"), p, width = 3.2, height = 3.2)
ggsave(file.path(output_dir, "boxplot.png"), p, width = 3.2, height = 3.2, dpi = 600)

