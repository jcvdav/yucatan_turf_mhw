# yucatan_turf_mhw
By: Victoria Lahey and Juan Carlos Villaseñor-Derbez

Investigating the exposure of Territorial Use Rights in Fisheries (TURFs) to marine heat waves and how these events impact small-scale fisheries production in the Yucatan Peninsula (Gulf of Mexico and the Caribbean)


## Repository structure as of June 24, 2025

```
-- data
   |__processed
      |__annual_catch_by_turf.rds
   |__raw
      |__tmp_registry.csv
      |__turf_eu_dictionary.csv
      |__turfs
-- LICENSE
-- README.md
-- scripts
   |__01_build_tmp_data.R
   |__02_build_catch_panel.R
-- yucatan_turf_mhw.Rproj
```

## ggplot showing total catch over time July 15, 2025

> ggplot(annual_catch_by_turf, aes(x = year, y = catch_kg)) +
+     stat_summary(fun = sum, geom = "line", color = "steelblue") +
+     scale_y_continuous(labels = comma) +
+     labs(
+         title = "Total Catch Over Time",
+         x = "Year",
+         y = "Catch (kg)"
+     )

## ggplot showing total catch over time by TURF

> ggplot(annual_catch_by_turf, aes(x = year, y = catch_kg)) +
+     geom_line(color = "blue") +
+     facet_wrap(~ turf_name, scales = "free_y") +
+     labs(
+         title = "Catch Over Time by TURF",
+         x = "Year",
+         y = "Catch (kg)"
+     ) +
+     theme_minimal()

## ggplot showing top 5 TURFS by total catch

> top5_turfs <- annual_catch_by_turf %>%
+     group_by(turf_name) %>%
+     summarise(total_catch = sum(catch_kg, na.rm = TRUE)) %>%
+     arrange(desc(total_catch)) %>%
+     slice_head(n = 5)
> 
> ggplot(top5_turfs, aes(x = reorder(turf_name, -total_catch), y = total_catch)) +
+     geom_col(fill = "lightblue") +
+     labs(
+         title = "Top 5 TURFs by Total Catch",
+         x = "TURF Name",
+         y = "Total Catch (kg)"
+     ) +
+     theme(axis.text.x = element_text(angle = 45, hjust = 1))

---------
