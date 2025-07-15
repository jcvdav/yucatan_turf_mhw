
## ggplot showing total catch over time overall in TURFs

library(scales)

ggplot(annual_catch_by_turf, aes(x = year, y = catch_kg)) +
  stat_summary(fun = sum, geom = "line", color = "steelblue") +
  scale_y_continuous(labels = comma) +
  labs(
    title = "Total Catch Over Time",
    x = "Year",
    y = "Catch (kg)"
  )


## ggplot showing total catch over time by TURFs

annual_catch_by_turf_sorted <- annual_catch_by_turf %>%
  arrange(turf_name, year)

ggplot(annual_catch_by_turf_sorted, aes(x = year, y = catch_kg)) +
  geom_line(color = "blue") +
  facet_wrap(~ turf_name, scales = "free_y") +
  labs(
    title = "Catch Over Time by TURF",
    x = "Year",
    y = "Catch (kg)"
  ) +
  theme_minimal()


## ggplot showing top 5 TURFs by total catch

ggplot(top5_turfs, aes(x = reorder(turf_name, -total_catch), y = total_catch)) +
  geom_col(fill = "lightblue") +
  labs(
    title = "Top 5 TURFs by Total Catch",
    x = "TURF Name",
    y = "Total Catch (kg)"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
