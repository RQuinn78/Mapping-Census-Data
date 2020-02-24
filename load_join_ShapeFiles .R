# assumes Garda Divsions SHP files are saved to a folder in your working directory

ireland <- rgdal::readOGR("Census2011_Garda_Divisions_Nov2013")
library (sf)
ireland_sf <- st_as_sf(ireland)

# then join the Ireland shape file to the data set

ireland_sf1 <- inner_join(ireland_sf, garda_smaller_total, by="DIVISION")
