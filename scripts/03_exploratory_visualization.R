## SOME DESCRIPTION HERE

# Load packages  ---------------------------------------------------------------
pacman::p_load(
  here,
  tidyverse,
  scales
)

# Load data --------------------------------------------------------------------
annual_catch_by_turf <- readRDS(file = here("data/processed/annual_catch_by_turf.rds")) |> 
  mutate(turf_name = str_remove(string = turf_name,
                                pattern = "SCPP"))

## "Total Catch Over Time"


# Visualzie the data  ----------------------------------------------------------
## Catch over time total
plot1 <- ggplot(annual_catch_by_turf, aes(x = year, y = catch_kg)) +
  stat_summary(fun = sum, geom = "line", color = "steelblue") +
  scale_y_continuous(labels = comma) +
  labs(
    x = "Year",
    y = "Catch (kg)"
  )

plot1


## "Catch Over Time by TURF"
annual_catch_by_turf_sorted <- annual_catch_by_turf %>%
  arrange(turf_name, year)

plot2 <- ggplot(annual_catch_by_turf_sorted, aes(x = year, y = catch_kg)) +
  geom_line(color = "blue") +
  facet_wrap(~ turf_name, scales = "free_y") +
  labs(
    x = "Year",
    y = "Catch (kg)"
  ) +
  theme_minimal()

plot2

## "Top 5 TURFs by Total Catch"
ggplot(top5_turfs, aes(x = reorder(turf_name, -total_catch), y = total_catch)) +
  geom_col(fill = "lightblue") +
  labs(
    x = "TURF Name",
    y = "Total Catch (kg)"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Export figures ---------------------------------------------------------------
ggsave(plot = plot1,
       filename = here("results/figures/total_catch_general.pdf"),
       width = 4,
       height = 2)

ggsave(plot = plot2,
       filename = here("results/figures/total_catch_by_TURF.pdf"),
       width = 8,
       height = 4)





