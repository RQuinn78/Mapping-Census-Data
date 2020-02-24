# assumes you have saved your Garda Divsions SHP files to a folder in your working directory

ireland <- rgdal::readOGR("Census2011_Garda_Divisions_Nov2013")
library (sf)
ireland_sf <- st_as_sf(ireland)

# you can then join your Ireland shape file to the data set

ireland_sf1 <- inner_join(ireland_sf, garda_smaller_total, by="DIVISION")
