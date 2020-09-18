# Visualising spatial and spatiotemporal data cubes with tmap

In this workshop you will learn how to plot spatial data in R by using the **tmap** package. This package is an implementation of the grammar of graphics for thematic maps, and resembles the syntax of **ggplot2**. This package is useful for both *exploration* and *publication* of spatial data, and offers both *static* and *interactive* plotting.

For those of you who are unfamiliar with spatial data in R, we will briefly introduce the fundamental packages for spatial data, which are **sf** and **stars**. With demonstrations and exercises, you will learn how to process spatial objects from various types (polygons, points, lines, rasters, and simple features), and how to plot them. 

Besides plotting spatial data, we will also discuss the possibilities of *publication*. Maps created with **tmap** can be exported as static images, html files, but they can also be embedded in **rmarkdown** documents and **shiny** apps.

### Documentation

See https://github.com/mtennekes/tmap for former presentations and blog posts about tmap. The most useful links are:

[Presentation slides: Creating thematic maps in R](https://mtennekes.github.io/downloads/presentations/tmap_opengeo_muenster.pdf)

[Lovelace, R., Nowosad, J., and Muenchow, J., 2019, Making maps with R. Chapter 8 from Geocomputation with R](https://geocompr.robinlovelace.net/adv-map.html)

[Tennekes, M., 2018, tmap: Thematic Maps in R, Journal of Statistical Software, 84(6), 1-39](https://doi.org/10.18637/jss.v084.i06)

We are currently writing a book on tmap. We aim to make a draft version public by the end of this year.

### Installation of tmap

Both `tmap` and `tmaptools` can be installed from CRAN. Note that the installation requires some effort for Linux and macOS, since additional system libraries are needed, e.g. `gdal`. See https://github.com/mtennekes/tmap#installation for installation details.

Loading the required packages:

```{r}
library(sf)
library(stars)
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