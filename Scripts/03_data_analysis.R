#HYPOTHESES

#H0: explicit content in songs has not increased through years in the pop music scene
#Ha: explicit content in songs has increased through years in the pop music scene 


# FIRST ----------------- 
# calculating means

library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)

#PRINCE

mean(Explicit_PR$explicit)

#MADONNA

mean(Explicit_MD$explicit)

#PITBULL

mean(Explicit_PB$explicit)

#DRAKE

mean(Explicit_DR$explicit)

# As we can see in this first case, the mean got higher and higher 
# through the years, especially with artists that became famous
# after 2000



