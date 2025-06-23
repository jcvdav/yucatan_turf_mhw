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
turfs <- st_read(here("data/turfs/ConcessionesQRoo.shp"))
landings <- readRDS(here("../mex_fisheries/data/mex_landings/clean/mex_annual_landings_by_eu.rds"))
registry <- read_csv(here("/Users/jcvd/Library/CloudStorage/Box-Box/project_data/mex-fisheries/data/mex_vessel_registry/clean/small_scale_vessel_registry.csv")) |> 
  select(eu_rnpa, economic_unit) |> 
  distinct()
## PROCESSING ##################################################################

# X ----------------------------------------------------------------------------
landings |> 
  filter(eu_rnpa %in% unique(turfs$))

## VISUALIZE ###################################################################

# X ----------------------------------------------------------------------------

## EXPORT ######################################################################

# X ----------------------------------------------------------------------------


SCPP Cozumel
SCPP Puerto Morelos
SCPP Tulum
SCPP Vigia Chico
SCPP Por La Justicia Social
SCPP Vanguardia del Mar
SCPP Jose Maria Azcorra
SCPP Langosteros del Caribe
SCPP Pescadores de Dzilam de Bravo
SCPP Pescadores Unidos de San Felipe
SCPP Manuel Cepeda Peraza
SCPP Pescadores de Rio Lagartos
SCPP El Cuyo