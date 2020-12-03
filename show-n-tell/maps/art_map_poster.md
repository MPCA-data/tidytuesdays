# Is it *MAP* or **`ART`**?

### Making a map poster *(or fun card)*


<br>

> Reference:
> <http://estebanmoro.org/post/2020-10-19-personal-art-map-with-r/>

<br>
<br>

To start, we need to choose an area of the world. I'm going to pick the wonderful city of Bemidji.
``` r
library(osmdata)

# Lat/Long boundary box for city coordinates
bbx <- getbb("Bemidji, MN")
```

<br>

Alternatively, you can be more specific and define your own boundary box:

``` r
if(FALSE) {
  
min_lon <- -71.28735; max_lon <- -70.900578
min_lat <- 42.245838; max_lat <- 42.453673

bbx <- rbind(x=c(min_lon,max_lon), y=c(min_lat,max_lat))

colnames(bbx) <- c("min","max")

}
```

<br>

Let’s see what type of data is available related to “highway” or
“railway”:

``` r
available_tags("highway")

available_tags("railway")
```

<br>

I’ll start with mapping **“bus\_stop”** locations.

``` r
stops <- bbx %>%
         opq()%>%
         add_osm_feature(key   = "highway", 
                         value = c("bus_stop")) %>%
         osmdata_sf()
```

<br>

We can use `ggplot` to map **sf** objects. Another great plus of using
`sf`.

``` r
library(ggplot2)
library(sf)

ggplot() +
        geom_sf(data      = stops$osm_points,
                aes(color = stops),
                size      = .4,
                alpha     = .65) +
        theme_void()
```

<br>

We can do the same for major highways:

``` r
hwys <- bbx %>%
         opq()%>%
         add_osm_feature(key   = "highway", 
                         value = c("motorway", "motorway_link", "trunk", "primary")) %>%
         osmdata_sf()

ggplot() +
        geom_sf(data      = highways$osm_lines,
                aes(color = highway),
                size      = .4,
                alpha     = .65) +
        theme_void()
```

<br>

For the backdrop of our map, let’s get all the smaller roads and
pathways that really give shape of our city.

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
                aes(color = paths),
                size      = .4,
                alpha     = .65) +
        theme_void()
```

<br>

### ALL TOGETHER

Now we can put them together. We’ll make the major roads larger to stand
out with `size = 0.6`

``` r
color_roads <- rgb(0.42, 0.449, 0.488)

ggplot() +
  geom_sf(data  = streets$osm_lines,
          col   = color_roads,
          size  = .4,
          alpha = .65) +
  geom_sf(data  = highways$osm_lines,
          col   = color_roads,
          size  = .6,
          alpha = .8)+
  coord_sf(xlim = c(min_lon,max_lon),
           ylim = c(min_lat,max_lat),
         expand = FALSE)+
  theme(legend.position = F) + 
  theme_void()
```

### Land Hoy

We need some land to ground ourselves. For that we can use `tigris`.

``` r
require(tigris)

counties <- counties(state = "MN", cb = T, class = "sf")

counties <- st_crop(counties,
                    xmin=min_lon, xmax=max_lon,
                    ymin=min_lat, ymax=max_lat)

ggplot() + 
  geom_sf(data=counties,fill="gray", lwd=0)+
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

### :scissors: Cut-cut

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
