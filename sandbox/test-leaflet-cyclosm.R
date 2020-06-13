library(leaflet)
library(leaflet.providers)
library(rgdal)    
library(sp)       
library(lubridate)
library(ggplot2)  
library(htmlwidgets)

# Update providers to the latest available and use them
# We need this to get the CylOSM provider
leaflet.providers::use_providers(leaflet.providers::get_providers())


GPX_file <- '/home/longwei/Téléchargements/Meudon_Explo_2.gpx'
wp <- rgdal::readOGR(GPX_file, layer = "track_points")

track <- readOGR(GPX_file, layer = "tracks", verbose = FALSE)


m <- leaflet() %>%
  addProviderTiles("CyclOSM") %>%
  addPolylines(data=track)
m  # Print the map
saveWidget(m, file="meudon_explo.html")