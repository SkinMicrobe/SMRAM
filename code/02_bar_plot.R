library(tidyverse)

input_file <- "data/bar_plot.csv"
output_dir <- "results/bar_plot"
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

plot_data <- read_csv(input_file, show_col_types = FALSE) %>%
  mutate(Group = factor(Group, levels = unique(Group)))

p <- ggplot(plot_data, aes(x = Group, y = Mean, fill = Group)) +
  geom_col(width = 0.65, color = "black", linewidth = 0.25) +
  geom_errorbar(aes(ymin = Mean - SEM, ymax = Mean + SEM), width = 0.18, linewidth = 0.35) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  labs(x = NULL, y = "Value") +
  theme_classic(base_size = 10) +
  theme(
    axis.text = element_text(color = "black"),
    axis.line = element_line(linewidth = 0.4),
    legend.position = "none"
  )

ggsave(file.path(output_dir, "bar_plot.pdf"), p, width = 3.2, height = 3.2)
ggsave(file.path(output_dir, "bar_plot.png"), p, width = 3.2, height = 3.2, dpi = 600)

