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
registry <- read_csv(here("/Users/jcvd/Library/CloudStorage/Box-Box/project_data/mex-fisheries/data/mex_vessel_registry/clean/small_scale_vessel_registry.csv")) |> 
  select(eu_rnpa, economic_unit) |> 
  distinct()

## EXPORT ######################################################################

# X ----------------------------------------------------------------------------
write_csv(x = registry, file = here("data/tmp_registry.csv"))