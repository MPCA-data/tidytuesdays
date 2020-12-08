# MAP ART

### Making a map painting/poster 

*Reference: <http://estebanmoro.org/post/2020-10-19-personal-art-map-with-r/>*

<br>

---

## Setup

### Required packages

``` r
library(osmdata)
library(sf)
library(tidyverse)
```
---

<br>

## A place

To start off, let's choose an area of the world to highlight. 

I'm going to pick the wonderful river city of Bemidji.

``` r
# Lat/Long boundary box for city coordinates
bbx <- getbb("Bemidji, MN")

# bbx <- getbb("Minneapolis, MN")
## You can also use capital's like "Tokyo"
```

<br>

Alternatively, you can be specific and set the exact coordinates of your boundary box:

``` r
if(FALSE) {
  
min_lon <- -71.28; max_lon <- -70.90
min_lat <-  42.24; max_lat <-  42.453

bbx <- rbind(x = c(min_lon, max_lon), 
             y = c(min_lat, max_lat))

colnames(bbx) <- c("min", "max")

}
```


<br>

You can view the map features available in OSM at https://wiki.openstreetmap.org/wiki/Map_Features.

Let’s see what type of open data is available related to the tags `highway` and `railway`:

``` r
# FYI
# If these don't work, skip to get_features() below

available_tags("highway")

available_tags("railway")



# Alternative, skip the internet test 

get_features <- function(feature) {

     osm_features <- "https://wiki.openstreetmap.org/wiki/Map_Features"
     
     pg <- xml2::read_html(httr::GET(osm_features))
     
     tags <- rvest::html_nodes(pg, 
                               sprintf("a[title^='Tag:%s']", 
                               feature))
                               
     tags <- vapply(strsplit(xml2::xml_attr(tags, "href"), 
                    "%3D"), 
                    function(i) i[2], character(1))
                
     return(unique(sort(tags)))
}

get_features("highway")

get_features("railway")

```

<br>

I’ll start with **“bus\_stop”** locations.

``` r
crossings <- bbx$boundingbox %>%
             opq() %>%
             add_osm_feature(key   = "railway", 
                             value = c("crossing")) %>%
             osmdata_sf()
```

<br>

## `ggplot` a map

It is true. We can use `ggplot` to map **sf** map objects. 
Another great plus of using `sf`.

``` r
ggplot() +
        geom_sf(data = crossings$osm_points,
                aes(color = railway),
                size      = 3,
                alpha     = 0.65) +
        theme_void()
```

<br>

We can do the same for major highways:

``` r
road_types <- c("motorway", "motorway_link", "trunk", "primary")

hwys <- bbx %>%
        opq()%>%
        add_osm_feature(key   = "highway", 
                        value = road_types) %>%
        osmdata_sf()


ggplot() +
        geom_sf(data      = hwys$osm_lines,
                aes(color = highway),
                size      = 0.4,
                alpha     = 0.65) +
        theme_void()
```

For the backdrop of our map, let’s get all the smaller roads and
pathways that give shape to our city.

``` r
paths <- bbx %>%
          opq()%>%
          add_osm_feature(key   = "highway", 
                          value = c("residential", "living_street",
                                    "service","unclassified",
                                    "pedestrian", "footway",
                                    "track","path")) %>%
          osmdata_sf()

ggplot() +
        geom_sf(data      = paths$osm_lines,
                aes(color = highway),
                size      = 0.4,
                alpha     = 0.65) +
        theme_void()
```

<br>

### ALL Together

Let's put everything together. 

> We’ll make the major roads larger to stand out with `size = 0.8`.

``` r
road_color <-  "darkgray" #rgb(0.42,0.449,0.488)

# Add small roads
map <- ggplot() +
       geom_sf(data  = paths$osm_lines,
               col   = road_color,
               size  = 0.4,
               alpha = 0.65) 
map

# Add big roads                
map <- map + geom_sf(data  = hwys$osm_lines,
                     col   = road_color,
                     size  = 0.8,
                     alpha = 0.8) 

map

# Add train X             
map <- map + geom_sf(data  = crossings$osm_points,
                     col   = "plum",
                     size  = 4,
                     alpha = 0.8) 
                     
map

# Trim the edges and drop legend              
map <- map + 
       coord_sf(xlim = c(bbx["x", "min"], bbx["x", "max"]),
                ylim = c(bbx["y", "min"], bbx["y", "max"]),
                expand = FALSE) +
       theme(legend.position = "none") 
  
map  

# Drop coordinates  
map <- map + theme_void() 
  
map 

```

### Land Ho!

We need some land to ground ourselves. For that we use `tigris`.

``` r
require(tigris)

counties <- counties(state = "MN", cb = T, class = "sf")

counties <- st_crop(counties,
                    xmin = min_lon, xmax = max_lon,
                    ymin = min_lat, ymax = max_lat)

ggplot() + 
  geom_sf(data = counties, fill = "gray", lwd = 0)+
  coord_sf(xlim = c(min(bbx[1,]), max(bbx[1,])), 
           ylim = c(min(bbx[2,]), max(bbx[2,])),
           expand = FALSE)+
  theme(legend.position = F) +
  theme_void()
```

### :droplet: WATER world

We can get a more detailed water layer using `area_water()` and feeding
it the County ID we’re interested in.

``` r
get_water <- function(county_id){
  area_water("MN", county_id, class = "sf")
}

water <- do.call(rbind, 
                 lapply(counties_MA$COUNTYFP,get_water))
water <- st_crop(water,
                 xmin=min_lon, xmax=max_lon,
                 ymin=min_lat, ymax=max_lat)
```

<br>

Map the blue-blue water:

``` r
ggplot() + 
  geom_sf(data        = water,
          inherit.aes = F,
          col         = "blue")+
  coord_sf(xlim   = c(min(bbx[1,]), max(bbx[1,])), 
           ylim   = c(min(bbx[2,]), max(bbx[2,])),
           expand = FALSE)+
  theme(legend.position = F) + 
  theme_void()
```

### :scissors: - - - - Cut - - - - along the - - - dotted-line - - - - -

Now for some crafting. Let’s cut out the more detailed water from the
County land layer.

``` r
st_cut <- function(x, y) {
  st_difference(x, st_union(y))
}

counties <- st_cut(counties, water)
```

<br>

Let's take a look!

``` r
ggplot() + 
  geom_sf(data = counties,
          lwd  = 0)+
  coord_sf(xlim   = c(min(bbx[1,]), max(bbx[1,])), 
           ylim   = c(min(bbx[2,]), max(bbx[2,])),
           expand = FALSE)+
  theme(legend.position = F) + 
  theme_void()
```

#
