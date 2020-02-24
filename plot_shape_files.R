# once data set and shape files are joined they can be graphed

library (ggplot2)
library (viridis)
ggplot(data = ireland_sf1) + geom_sf(aes(fill = total)) + 
  scale_fill_viridis(option = "magma") +
  labs (fill="Total Crimes")
