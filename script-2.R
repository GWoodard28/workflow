library(tidyverse)

median_prices <- diamonds |>
  summarise(median_price = median(price), .by = c(cut, color))

diamonds_plot <- ggplot(median_prices, aes(x = color, y = cut, fill = median_price)) +
  geom_tile(color = "white", linewidth = 0.8) +
  scale_fill_viridis_c(
    option = "C",
    labels = \(x) paste0("$", format(x, big.mark = ",", scientific = FALSE))
  ) +
  labs(
    title = "Diamond prices by cut and color",
    subtitle = "Median price for each combination",
    x = "Color grade",
    y = "Cut grade",
    fill = "Median price"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    panel.grid = element_blank(),
    legend.position = "bottom"
  )

ggsave("diamonds-2.png", plot = diamonds_plot, width = 10, height = 6, dpi = 300)
