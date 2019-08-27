#The first part of this code is taken directly from the point transect
#survey design workshop exercise 6.

library(dssd)
library(sf)

# Project region
shapefile.name <- system.file("extdata", "TentsmuirUnproj.shp", package = "dssd")
sf.shape <- read_sf(shapefile.name)
# Check current coordinate reference system
st_crs(sf.shape)
# Define a European Albers Equal Area projection
proj4string <- "+proj=aea +lat_1=56 +lat_2=62 +lat_0=50 +lon_0=-3 +x_0=0
                +y_0=0 +ellps=intl +units=m"
# Project the study area on to a flat plane
projected.shape <- st_transform(sf.shape, crs = proj4string)

region.tm <- make.region(region.name = "Tentsmuir",
                         strata.name = c("Main Area", "Morton Lochs"),
                         shape = projected.shape)

# Set up a multi strata systematic point transect design
design.tm <- make.design(region = region.tm,
                         transect.type = "point",
                         design = "systematic",
                         samplers = c(25,15),
                         design.angle = 0,
                         edge.protocol = "minus",
                         truncation = 100)

# Create a single survey from the design
survey.tm <- generate.transects(design.tm)
plot(region.tm, survey.tm)

### Code from this point is *NEW* ###

# Extract the sf spatial samplers
transects <- survey.tm@samplers
# Transects do not have crs set so set it to same as projected study area
st_crs(transects) <- proj4string

# Define the lat/lon coordinate system you wish for your coordinates
rev.proj4string <- "+proj=longlat +datum=WGS84 +no_defs"
# Now project the transects into lat/lon
unproj.transects <- st_transform(transects, crs = rev.proj4string)

# Check unprojected transects are inside unprojected area
plot(sf.shape$geometry)
plot(unproj.transects$geometry, add = TRUE)

# Change from sf object into sp SpatialDataFrame
sp.transects <- as(unproj.transects, "Spatial")

library(rgdal)
# Now we can write the gpx file (NB will write to current working dir!)

writeOGR(sp.transects,
         dsn="points.gpx", layer="points", driver="GPX",
         dataset_options="GPX_USE_EXTENSIONS=yes")


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LINE TRANSECTS
# Now modify the design to be a line transect design
# warning - Low transects number as a code check only!
design.tm <- make.design(region = region.tm,
                         transect.type = "line",
                         design = "systematic",
                         samplers = c(10,5),
                         design.angle = 90,
                         edge.protocol = "minus",
                         truncation = 100)

# Create a single survey from the design
survey.tm <- generate.transects(design.tm)
plot(region.tm, survey.tm)

# Extract the sf spatial samplers
transects <- survey.tm@samplers
# Transects do not have crs set so set it to same as projected study area
st_crs(transects) <- proj4string

# Define the lat/lon coordinate system you wish for your coordinates
rev.proj4string <- "+proj=longlat +datum=WGS84 +no_defs"
# Now project the transects into lat/lon
unproj.transects <- st_transform(transects, crs = rev.proj4string)

# Check unprojected transects are inside unprojected area
plot(sf.shape$geometry)
plot(unproj.transects$geometry, add = TRUE)

# Change from sf object into sp SpatialDataFrame
sp.transects <- as(unproj.transects, "Spatial")

# Now we can write the gpx file (NB will write to current working dir!)
writeOGR(sp.transects,
         dsn="lines.gpx", layer="lines", driver="GPX",
         dataset_options="GPX_USE_EXTENSIONS=yes")



