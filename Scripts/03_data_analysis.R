#HYPOTHESES

#H0: explicit content in songs has not increased through years in the pop music scene
#Ha: explicit content in songs has increased through years in the pop music scene 


# FIRST ----------------- 
# calculating means

library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)
library(htmltools)

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

# SECOND ---------------

#PRINCE

library(dplyr)

plotdata <- Explicit_PR %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont = mean(explicit))

# plot mean 
ggplot(plotdata, 
       aes(x = album_release_year, 
           y = mean_expcont)) +
  geom_bar(stat = "identity")

#MADONNA

plotdata2 <- Explicit_MD %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont2 = mean(explicit))

# plot mean 
ggplot(plotdata2, 
       aes(x = album_release_year, 
           y = mean_expcont2)) +
  geom_bar(stat = "identity")


#PITBULL

plotdata3 <- Explicit_PB %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont3 = mean(explicit))

# plot mean 
ggplot(plotdata3, 
       aes(x = album_release_year, 
           y = mean_expcont3)) +
  geom_bar(stat = "identity")


#DRAKE

plotdata4 <- Explicit_DR %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont4 = mean(explicit))

# plot mean 
ggplot(plotdata4, 
       aes(x = album_release_year, 
           y = mean_expcont4)) +
  geom_bar(stat = "identity")

#As we can observe in these plots, artists from 2000-2020 record 
# way more explicit content in their songs, the average explicit content mean
# gets higher with time. 

# Now we can try to observe the changes by putting together all
# the different data frames

library(tidyr)
library(ggplot2)
AllDf <- rbind(Explicit_PR,
               Explicit_MD,
               Explicit_PB,
               Explicit_DR)
AllDf<- add_column()

boxplot(explicit ~ album_release_year, data = AllDf, 
        horizontal = T,
        las = 2)

m.v <- lm(explicit~album_release_year, data = AllDf2) 
summary(m.v) 

#adding the "artists" column to the data frame

library(ggplot2)
library(viridis)
library(hrbrthemes)

AllDf2 <- AllDf %>%
  add_column(artists = "artists")
AllDf2

AllDf2 = mutate(
  AllDf2, 
  artists = ifelse(AllDf2$album_release_year <= 1990, "1. Prince",
                   ifelse(AllDf2$album_release_year <= 2000, "2. Madonna",
                          ifelse(AllDf2$album_release_year <= 2010, "3. Pitbull",
                                 ifelse(AllDf2$album_release_year <= 2020, "4. Drake")))))


ggplot(AllDf2, aes(explicit, album_release_year, colour = artists)) + 
  geom_point()+
  facet_wrap(~artists, ncol = 5) +
  ylab("Year") +
  xlab("Explicit content") +
  scale_x_continuous(breaks = seq(0, 1)) +
  theme_bw()


ggplot(AllDf2, aes(fill=artists, y=album_release_year, x=explicit)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_fill_viridis(discrete = T, option = "E") +
  ggtitle("Explicit lyrics through time") +
  facet_wrap(~artists, ncol = 5) +
  theme_ipsum() +
  theme(legend.position="none") +
  xlab("Explicit lyrics in songs")+
  ylab("Year of release")
  scale_x_continuous(breaks = seq(0, 1))