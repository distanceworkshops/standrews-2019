# example of segmenting transects

# for spatial things
library(sf)
library(dplyr)


# 1. getting the data into an sf-compatible format

# load the data
# here we have 2 rows per transect, so we need to make those two
# rows into a single line, which we do below...
transects <- read.csv("All_Waypoints_2003_Converted_RMR2018.csv")

# select only the columns we want
transects <- transects %>%
  # make a new column called transect_id, combining
  # the transect, site and repeat number
  mutate(transect_id = paste0(SITE, "-", TRANSECT, "-", REP)) %>%
  mutate(long     = wgs84_x,
         lat      = wgs84_y) %>%
  select(transect_id, lat, long)

# some lines have only 1 waypoint, so something is wrong
# just going to remove them for now
tr_names <- names(table(transects$transect_id))
tr_keep <- tr_names[which(table(transects$transect_id)!=1)]
transects <- subset(transects, transect_id %in% tr_keep)

# make that data.frame into a spatial object
# for now just using lat/long in WGS84
transects <- transects %>%
  st_as_sf(coords=c("long", "lat")) %>%
  st_set_crs(4326)
# make that into some lines
transects_sf <- transects %>%
  group_by(transect_id) %>%
  summarise(do_union = FALSE) %>%
  st_cast("LINESTRING")

# plot to check what we have is right
plot(st_geometry(transects_sf), axes=TRUE)

# 2. split the lines

# use st_segmentize to take each transect and make mini-lines from them
# note that we are setting the *maximum* length of the segments, so not all
# segments will be the same length (I think the algorithm tries to get each
# segment as close to 250m as possible)
segs_line <- transects_sf %>%
  st_segmentize(dfMaxLength=units::set_units(250, m))

# then need this function to turn those multilines into single lines
# one per row...
# function borrowed from:
# https://dieghernan.github.io/201905_Cast-to-subsegments/
stdh_cast_substring <- function(x, to = "MULTILINESTRING") {
  ggg <- st_geometry(x)

  if (!unique(st_geometry_type(ggg)) %in% c("POLYGON", "LINESTRING")) {
    stop("Input should be  LINESTRING or POLYGON")
  }
  for (k in 1:length(st_geometry(ggg))) {
    sub <- ggg[k]
    geom <- lapply(
      1:(length(st_coordinates(sub)[, 1]) - 1),
      function(i)
        rbind(
          as.numeric(st_coordinates(sub)[i, 1:2]),
          as.numeric(st_coordinates(sub)[i + 1, 1:2])
        )
    ) %>%
      st_multilinestring() %>%
      st_sfc()

    if (k == 1) {
      endgeom <- geom
    }
    else {
      endgeom <- rbind(endgeom, geom)
    }
  }
  endgeom <- endgeom %>% st_sfc(crs = st_crs(x))
  if (class(x)[1] == "sf") {
    endgeom <- st_set_geometry(x, endgeom)
  }
  if (to == "LINESTRING") {
    endgeom <- endgeom %>% st_cast("LINESTRING")
  }
  return(endgeom)
}

# apply that over the segments to separate them
segs_line <- segs_line %>%
  stdh_cast_substring(to="LINESTRING")

# note that this plot now takes longer as we have lots of segments
# also note alternating colours
plot(st_geometry(segs_line), col=1:2, lwd=2, axes=TRUE)

# add a column with a label for the segments
segs_line$Sample.Label <- 1:nrow(segs_line)

# now project using Alaska Albers in metres
# see https://spatialreference.org/ for more information to get
# the ESPG number or CRS string to give to st_transform
segs_line_proj <- segs_line %>%
  st_transform(3338)

# check that worked using a plot, note the difference in axis scale
plot(st_geometry(segs_line_proj), col=1:2, lwd=2, axes=TRUE)

# now take those line segments and turn them into little boxes
# set the width of those boxes to be 250 metres, need to also set
# the endCapStyle so either end is flat
segs_buff <- segs_line_proj %>%
  st_buffer(250, endCapStyle="FLAT")
plot(segs_buff, axes=TRUE)

# 3. export for DSM, need to find centroids and lengths

# first get the centroids
segs_centroids <- segs_buff %>%
  st_centroid()
# add column for effort
segs_centroids$Effort <- as.numeric(st_length(segs_line))

# now make a data.frame with that information in it
# first get the non-geo data
segs_dsm <- st_drop_geometry(segs_centroids)
# then add the geo data to it as extra columns
segs_dsm <- cbind(segs_dsm, st_coordinates(segs_centroids))
# check that's what we want
head(segs_dsm)

# 4. linking observations and segments

# first generating some fake data, you will have points for
# your observations
bbox <- st_bbox(segs_buff)
dat <- data.frame(x=runif(2000, bbox[1], bbox[3]),
                  y=runif(2000, bbox[2], bbox[4]))
dat <- dat %>%
  st_as_sf(coords=c("x", "y")) %>%
  st_set_crs(3338)

dat <- st_join(dat, segs_buff, join=st_within)
dat <- dat[!is.na(dat$transect_id),]
dat$transect_id <- NULL
dat$Sample.Label <- NULL
## fake data generation done

# which points are in which segments
dat <- st_join(dat, segs_buff, join=st_within)

# plot the data and segment buffers
plot(st_coordinates(segs_centroids), axes=TRUE)
plot(dat, add=TRUE, pch=19)

# looking at dat we now have a Sample.Label column with the
# segment the observation was seen in
head(dat)