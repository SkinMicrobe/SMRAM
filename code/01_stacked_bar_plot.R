library(tidyverse)

input_file <- "data/stacked_bar_plot.csv"
output_dir <- "results/stacked_bar_plot"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

plot_data <- read_csv(input_file, show_col_types = FALSE) %>%
  mutate(
    Group = factor(Group, levels = unique(Group)),
    Category = factor(Category, levels = rev(unique(Category)))
  )

p <- ggplot(plot_data, aes(x = Group, y = Value, fill = Category)) +
  geom_col(width = 0.72, color = "white", linewidth = 0.2) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.03))) +
  labs(x = NULL, y = "Relative abundance", fill = NULL) +
  theme_classic(base_size = 10) +
  theme(
    axis.text = element_text(color = "black"),
    axis.line = element_line(linewidth = 0.4),
    legend.key.size = unit(3.2, "mm"),
    legend.text = element_text(size = 7),
    legend.position = "right"
  )

ggsave(file.path(output_dir, "stacked_bar_plot.pdf"), p, width = 4.8, height = 3.2)
ggsave(file.path(output_dir, "stacked_bar_plot.png"), p, width = 4.8, height = 3.2, dpi = 600)

