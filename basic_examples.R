library(tmap)
library(sf)
library(stars)

data(World)
data(land)
data(metro)


plot(World)

qtm(World)
qtm(land)
qtm(metro)

tmap_mode("view")

qtm(land) +
  qtm(World, fill = NULL)


tm_shape(World) +
  tm_polygons("HPI", style = "kmeans", n = 8, palette = "Blues")

tm_shape(World) +
  tm_polygons("HPI", style = "kmeans", n = 8, palette = "Blues")

tm_shape(land) +
  tm_raster("trees") +
tm_shape(World) +
  tm_borders()
  

tm_shape(land) +
  tm_raster("trees") +
  tm_shape(World, is.master = TRUE) +
  tm_borders()









#https://github.com/mtennekes/tmap-workshop






