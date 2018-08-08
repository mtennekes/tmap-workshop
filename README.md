# Plotting spatial data in R

In this workshop you will learn how to plot spatial data in R by using the **tmap** package. This package is an implementation of the grammar of graphics for thematic maps, and resembles the syntax of **ggplot2**. This package is useful for both *exploration* and *publication* of spatial data, and offers both *static* and *interactive* plotting.

For those of you who are unfamiliar with spatial data in R, we will briefly introduce the fundamental packages for spatial data, which are **sf** and **raster**. With demonstrations and exercises, you will learn how to process spatial objects from various types (polygons, points, lines, rasters, and simple features), and how to plot them. Feel free to bring your own spatial data.

Besides plotting spatial data, we will also discuss the possibilities of *publication*. Maps created with **tmap** can be exported as static images, html files, but they can also be embedded in **rmarkdown** documents and **shiny** apps.

R packages: tmap, sf, sp, raster, rmarkdown, shiny

[Tennekes, M., 2018, tmap: Thematic Maps in R, Journal of Statistical Software, 84(6), 1-39](https://doi.org/10.18637/jss.v084.i06)


### Overview of CRAN pacakges on spatial data

176 CRAN packages are listed in the [CRAN Task View: Analysis of Spatial Data](https://cran.r-project.org/web/views/Spatial.html)
I can imagine, you can't see the wood for the trees anymore. An excellent online book to get started with spatial data is: https://geocompr.robinlovelace.net/. There are two fundamental package for spatial data:

* `sf` classes and methods for vector data (which has replaced `sp`, although many spatial packages still rely on `sp`)
* `raster` classes and methods for raster data (will eventually be replaced by `stars`)

These two packages will allow you to do all basic analysis and visualization of spatial data.

The `tmap` package is build on top of the shoulders of these two and many other great packages. As a consequence, once you install tmap, the most important other packages that are useful for spatial data will be installed as well. Note that installation may therefore require some effort. 


### Installation of tmap

Both `tmap` and `tmaptools` can be installed from CRAN. Note that the installation requires some effort for Linux and macOS, since additional system libraries are needed, e.g. `gdal`. See https://github.com/mtennekes/tmap#installation for installation details.

For those of you who use Docker, see https://hub.docker.com/r/robinlovelace/geocompr which contains all packages needed for spatial data visualization (including tmap and tmaptools).

Loading the required packages:

```{r}
library(sf)
library(raster)
library(tmap)
library(tmaptools)
```


## Getting spatial data

It's your choice what spatial data you want to use in this workshop. Some suggestions:

#### Data contained in tmap

There are a couple of datasets contained in tmap. The most interesting are `World`, which contains World country data, `metro`, which contains population time series for large metropolitan areas, and `land`, which is rasterized data of land use and tree coverage.

```{r}
library(tmap)
data(World, metro, land)
```

#### Data from spData and spDataLarge

The packages `spData` and `spDataLarge` contain many spatial datasets. See `https://github.com/Nowosad/spData` for an overview of available datasets. 

```{r}
library(spData)
library(spDataLarge) 
# install spDataLarge with install.packages('spDataLarge', repos='https://nowosad.github.io/drat/', type='source'))
```

#### Open Street Map data
The pacakge `osmdata` is an interface to OpenStreetMap.

```{r}
library(osmdata)

q <- opq("The Hague")
q_smkt <- add_osm_feature(q, key = "shop", value = "supermarket", value_exact = FALSE)
x_smkt <- osmdata_sf(q_smkt)
```

Large datasets from Open Street Map per country can be found at https://download.geofabrik.de/ 


#### Natural Earth Data
The package `rnaturalearth` is an interface to `www.naturalearthdata.com`, a great source of shapes.

```{r}
library(rnaturalearth)
airports <- ne_download(scale = 10, type = 'airports' )
```

#### Crimes in London

This [file](https://www.jstatsoft.org/index.php/jss/article/downloadSuppFile/v084i06/crimes_in_Greater_London_2015-10.zip) contains data from crimes committed in Greater London in October 2015. It is used in the [tmap JSS paper](https://doi.org/10.18637/jss.v084.i06). See `vignette("tmap-JSS-code")` for the updated reproduction code.


## Assignment

*Explore*, *analyse* and *present* the dataset of your choice with tmap. 

* In the exploration phase, try to find interesting patterns in the data. Experiment with different types of layers and aesthetic mappings. 
* Next, try different color palettes and class intervals. Also, experiment with small multiples. 
* Finally, fine-tune the maps such that they are publication-ready. Export them to either static files of interactive maps.

Extra: embed a map made with tmap in a shiny app. A shiny app can be useful for exploration, analysis, and presentation.