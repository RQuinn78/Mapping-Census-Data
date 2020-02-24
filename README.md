# Mapping-Census-Data

This was a project for the [Sonrai R Users MeetUp](https://www.meetup.com/sonRai/events/265838349/) on November 14th 2019. A data visualisation competition was held for the meet up and competitors had a choice of 3 data sets. This example uses the Garda districts data set which consists of numbers of crimes in various categories reported at Garda Divisions and their stations around the country between 2010 and the beginning of 2016. Dataset is available at [Open Data - data.gov.ie](https://data.gov.ie/dataset/crimes-at-garda-stations-level-2010-2016).

The data set consists of crime statistics for 28 Garda Divsional Areas and 563 Garda Stations in Ireland across 12 categories of offence. The process of creating a single map to summarise crimes by Divisional Area is fairly simple and is summarised below. 

In order to map the data onto a map of Garda Divisions the ESRI Shape (SHP) files for Garda Divsions at [Census Boundary Files](https://www.cso.ie/en/census/census2011boundaryfiles/) are required. Depending on the type of data being mapped then different boundary files are required e.g. boundary files for Irish counties for census data. 

1. The first thing to do is to tidy up the data set so that it can be merged with the data in the Boundary Files using [this script](https://github.com/RQuinn78/Mapping-Census-Data/blob/master/Data%20Preparation.R). This also summarises the data so that it can be graphed by Division. 

2. The data in the Garda Divisions SHP file needs to be [loaded and merged](https://github.com/RQuinn78/Mapping-Census-Data/blob/master/load_join_ShapeFiles%20.R) with the data set. 

3. Then the data can be plotted

![](https://github.com/RQuinn78/Mapping-Census-Data/blob/master/Total_Crimes_Garda_Division.jpeg)

