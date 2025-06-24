################################################################################
# title
################################################################################
#
# Juan Carlos Villaseñor-Derbez
# jc_villasenor@miami.edu
# date
#
# Description
#
################################################################################

## SET UP ######################################################################

# Load packages ----------------------------------------------------------------
pacman::p_load(
  here,
  tidyverse,
  sf
)

# Load data --------------------------------------------------------------------
dictionary <- read_csv(here("data/raw/turf_eu_dictionary.csv")) |> 
  mutate_all(as.character)                                                      # Make sure everything is stored as a character, not a number

landings <- readRDS(here("../mex_fisheries",
                         "data/mex_landings",
                         "clean/mex_annual_landings_by_eu.rds"))                # Reading from external data source

## PROCESSING ##################################################################

# Filter and combine  ----------------------------------------------------------
turf_landings <- landings |> 
  filter(main_species_group == "LANGOSTA") |>                                   # Only keep lobster information 
  inner_join(dictionary, by = join_by("eu_rnpa" == "rnpa")) |>                  # Add the TURF name
  select(year, eu_rnpa, turf_name, catch_kg = live_weight)                      # Keep variables of interest only

## EXPORT ######################################################################

# X ----------------------------------------------------------------------------
saveRDS(object = turf_landings,
        file = here("data", "processed", "annual_catch_by_turf.rds"))
