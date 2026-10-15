library(tidyverse)

diamonds_plot <- ggplot(diamonds, aes(x = cut, y = price, fill = cut)) +
  geom_violin(trim = FALSE, alpha = 0.8, color = "white") +
  geom_boxplot(width = 0.12, fill = "white", outlier.shape = NA) +
  scale_fill_viridis_d(option = "C", guide = "none") +
  scale_y_log10(labels = scales::label_dollar()) +
  labs(
    title = "Diamond prices across cut grades",
    subtitle = "Violin shapes show price distributions; boxes mark the middle half",
    x = "Cut grade",
    y = "Price (USD, logarithmic scale)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

ggsave("diamonds-2.png", plot = diamonds_plot, width = 10, height = 6, dpi = 300)
