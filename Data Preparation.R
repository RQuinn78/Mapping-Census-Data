# assumes the file with data is in the working directory

library (readr)
library (dplyr)
garda <- read_csv("garda_stations.csv")

# prep data so it can be joined with the Garda Division shp file
garda$Divisions <- gsub("Division", "", garda$Divisions)
garda$Divisions <- trimws(garda$Divisions, which=c("right"))
garda$Divisions <- gsub("D.M.R. Northern", "DMR North", garda$Divisions)
garda$Divisions <- gsub("D.M.R. Western", "DMR West", garda$Divisions)
garda$Divisions <- gsub("D.M.R. Southern", "DMR South", garda$Divisions)
garda$Divisions <- gsub("D.M.R. North Central", "DMR North Central", garda$Divisions)
garda$Divisions <- gsub("D.M.R. Eastern", "DMR East", garda$Divisions)
garda$Divisions <- gsub("D.M.R. South Central", "DMR South Central", garda$Divisions)

# total all crimes by Division per year, also total all crimes for all years per Divsion
Year <- c("2003", "2004", "2005","2006", "2007", "2008", "2009", "2010", "2011", "2012",
          "2013", "2014", "2015")
totals_all<- rbind.data.frame (sum (garda[, grep("2003", names(garda), value=TRUE)]),
       sum (garda[, grep("2004", names(garda), value=TRUE)]),
       sum (garda[, grep("2005", names(garda), value=TRUE)]),
       sum (garda[, grep("2006", names(garda), value=TRUE)]),
       sum (garda[, grep("2007", names(garda), value=TRUE)]),
       sum (garda[, grep("2008", names(garda), value=TRUE)]),
       sum (garda[, grep("2009", names(garda), value=TRUE)]),
       sum (garda[, grep("2010", names(garda), value=TRUE)]),
       sum (garda[, grep("2011", names(garda), value=TRUE)]),
       sum (garda[, grep("2012", names(garda), value=TRUE)]),
       sum (garda[, grep("2013", names(garda), value=TRUE)]),
       sum (garda[, grep("2014", names(garda), value=TRUE)]), 
       sum (garda[, grep("2015", names(garda), value=TRUE)]))
colnames (totals_all) <- "Total_All_Crimes"
totals_all_year <- cbind.data.frame (Year, totals_all)

# summarise data
garda_smaller <- garda[, c(3, 6:172)] %>% group_by(Divisions) %>% summarise_all(funs(sum))
garda_smaller <- mutate (garda_smaller, total= rowSums(garda_smaller[,c(2:168)]))
garda_smaller_total <- garda_smaller[,c(1,169)]
names(garda_smaller_total)[names(garda_smaller_total) == "Divisions"] <- "DIVISION"
