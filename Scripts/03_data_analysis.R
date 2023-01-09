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

m1 <- mean(Explicit_PR$explicit)

#MADONNA

m2<-mean(Explicit_MD$explicit)

#PITBULL

m3 <-mean(Explicit_PB$explicit)

#DRAKE

m4 <- mean(Explicit_DR$explicit)

# As we can see in this first case, the mean got higher and higher 
# through the years, especially with artists that became famous
# after 2000

#PRINCE

library(dplyr)

plotdata <- Explicit_PR %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont = mean(explicit))

# plot mean 
ggplot(plotdata, 
       aes(x = album_release_year, 
           y = mean_expcont)) +
  geom_bar(stat = "identity")+
  xlab("Year of release")+
  ylab("Explicit lyrics mean")

#MADONNA

plotdata2 <- Explicit_MD %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont2 = mean(explicit))

# plot mean 
ggplot(plotdata2, 
       aes(x = album_release_year, 
           y = mean_expcont2)) +
  geom_bar(stat = "identity")+
  xlab("Year of release")+
  ylab("Explicit lyrics mean")


#PITBULL

plotdata3 <- Explicit_PB %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont3 = mean(explicit))

# plot mean 
ggplot(plotdata3, 
       aes(x = album_release_year, 
           y = mean_expcont3)) +
  geom_bar(stat = "identity")+
  xlab("Year of release")+
  ylab("Explicit lyrics mean")


#DRAKE

plotdata4 <- Explicit_DR %>%
  group_by(album_release_year) %>%
  summarize(mean_expcont4 = mean(explicit))

# plot mean 
ggplot(plotdata4, 
       aes(x = album_release_year, 
           y = mean_expcont4)) +
  geom_bar(stat = "identity")+
  xlab("Year of release")+
  ylab("Explicit lyrics mean")

#As we can observe in these plots, artists from 2000-2020 record 
# way more explicit content in their songs, the average explicit content mean
# gets higher with time. 

# SECOND --------
#Confronting the different artists

library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(ggrepel)
library(tibble)

artists_means=tibble(Variables= colnames(1:4),m1,m2,m3,m4) %>% 
  rename("PRINCE"="m1") %>% 
  rename("MADONNA"="m2") %>% 
  rename("PITBULL" = "m3") %>% 
  rename("DRAKE"="m4")

artists_means2 <- data.frame(artists=c("PRINCE", "MADONNA", "PITBULL","DRAKE"),
                             means=c(m1, m2, m3, m4))

ggplot(artists_means2, aes(x=artists, y=means, color=artists)) + 
  geom_point(size=6) +
  theme_ipsum()+
  ylab("Explicit means") +
  xlab("Artists") +
  ggtitle("Explicit content mean for each artist")+
  geom_text(aes(label = round(means,digits = 3)), nudge_y = 0.05)

# Now we can try to observe the changes by putting together all
# the different data frames

library(tidyr)
library(ggplot2)
AllDf <- rbind(Explicit_PR,
               Explicit_MD,
               Explicit_PB,
               Explicit_DR)

#adding the "artists" column to the data frame

library(ggplot2)
library(viridis)
library(hrbrthemes)

AllDf2 <- AllDf %>%
  add_column(artists = "artists")

AllDf2 = mutate(
  AllDf2, 
  artists = ifelse(AllDf2$album_release_year <= 1990, "Prince",
                   ifelse(AllDf2$album_release_year <= 2000, "Madonna",
                          ifelse(AllDf2$album_release_year <= 2010, "Pitbull",
                                 ifelse(AllDf2$album_release_year <= 2020, "Drake")))))

m.v <- lm(explicit~album_release_year, data = AllDf2) 
summary(m.v) 

#PLOTS

AllDf3 <- data.frame(year=c(plotdata$album_release_year, 
                         plotdata2$album_release_year,
                         plotdata3$album_release_year,
                         plotdata4$album_release_year),
                  mean=c(plotdata$mean_expcont,
                         plotdata2$mean_expcont2,
                         plotdata3$mean_expcont3,
                         plotdata4$mean_expcont4),
                  artists=c("artist"))

AllDf3 = mutate(
  AllDf3, 
  artists = ifelse(AllDf3$year <= 1990, "Prince",
                   ifelse(AllDf3$year <= 2000, "Madonna",
                          ifelse(AllDf3$year <= 2010, "Pitbull",
                                 ifelse(AllDf3$year <= 2020, "Drake")))))

ggplot(AllDf3, aes(mean, year, colour = artists)) + 
  geom_point()+
  facet_wrap(~artists, ncol = 5) +
  ylab("Year") +
  xlab("Explicit content") +
  scale_x_continuous(breaks = seq(0, 1)) +
  theme_bw()


ggplot(AllDf3, aes(fill=artists, y=year, x=mean)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_fill_viridis(discrete = T, option = "E") +
  ggtitle("Explicit lyrics through time") +
  facet_wrap(~artists, ncol = 5) +
  theme_ipsum() +
  theme(legend.position="none") +
  xlab("Explicit lyrics in songs")+
  ylab("Year of release")
  scale_x_continuous(breaks = seq(0, 1))