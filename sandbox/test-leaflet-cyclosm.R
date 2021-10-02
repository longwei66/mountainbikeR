library(leaflet)
library(leaflet.providers)
library(rgdal)    
library(sp)       
library(lubridate)
library(ggplot2)  
library(htmlwidgets)
library(inlabru)
library(data.table)

# Update providers to the latest available and use them
# We need this to get the CylOSM provider
leaflet.providers::use_providers(leaflet.providers::get_providers())


#GPX_file <- '/home/longwei/Téléchargements/Meudon_Explo_2.gpx'
GPX_file <- '/home/longwei/Téléchargements/A_la_fra_che_et_dans_la_boue_.gpx'

wp <- rgdal::readOGR(GPX_file, layer = "track_points")

track <- readOGR(GPX_file, layer = "tracks", verbose = FALSE)


m <- leaflet() %>%
  addProviderTiles("CyclOSM") %>%
  addPolylines(data=track)
m  # Print the map
saveWidget(m, file="meudon_explo.html")


## get activity coodinnates
my_track <- as.data.table(my_activity_stream_lag_long$latlng$data)

# Create a data frame defining three lines
lns <- data.frame(
  xs = my_track[1:(nrow(my_track)-1)]$V2, ys = my_track[1:(nrow(my_track)-1)]$V1, # start points
  xe = my_track[2:(nrow(my_track))]$V2, ye = my_track[2:(nrow(my_track))]$V1
) # end points

# Conversion to SpatialLinesDataFrame without CRS
spl <- sline(lns,
             start.cols = c("xs", "ys"),
             end.cols = c("xe", "ye")
)
# Plot the lines
ggplot() +
  gg(spl)



m <- leaflet() %>%
  addProviderTiles("CyclOSM") %>%
  addPolylines(data=spl)
m  # Print the map
