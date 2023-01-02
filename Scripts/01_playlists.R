
#HYPOTHESIS ------------------
# The level of explicit content in music has increased over time and 
# especially with new artists. 
# The idea behind this project is to take 4 pillars in the pop-music scene, 
# starting from the 60-70's till our days. The artists that were selected
# are: Prince (80-90's), Madonna (90-00's), Pitbull (00-10's) 
# and Drake (10-20's)

# - PRINCE 80-90
# - MADONNA 90-00
# - PITBULL 00-10
# - DRAKE 10-22

# Getting audio features ----------------

PRINCE <- get_artist_audio_features("Prince")
MADONNA <- get_artist_audio_features("Madonna")
PITBULL <- get_artist_audio_features("Pitbull")
DRAKE <- get_artist_audio_features("Drake")

# PRINCE

Explicit_PR <- PRINCE %>% 
  filter %>% 
  select(track_name, album_release_year, explicit)

Explicit_PR = mutate(
  Explicit_PR, 
  album_release_year = ifelse(Explicit_PR$album_release_year == 1980, "1980",
                              ifelse(Explicit_PR$album_release_year == 1981, "1981",
                                     ifelse(Explicit_PR$album_release_year == 19682, "1982",
                                            ifelse(Explicit_PR$album_release_year == 1983, "1983",
                                                   ifelse(Explicit_PR$album_release_year == 1984, "1984",
                                                          ifelse(Explicit_PR$album_release_year == 1985, "1985",
                                                                 ifelse(Explicit_PR$album_release_year == 1986, "1986",
                                                                        ifelse(Explicit_PR$album_release_year == 1987, "1987",
                                                                               ifelse(Explicit_PR$album_release_year == 1988, "1988",
                                                                                      ifelse(Explicit_PR$album_release_year == 1989, "1989",
                                                                                             ifelse(Explicit_PR$album_release_year == 1990, "1990",
                                                                                                    "na"))))))))))))


# MADONNA

Explicit_MD <- MADONNA %>% 
  filter %>% 
  select(track_name, album_release_year, explicit)

Explicit_MD = mutate(
  Explicit_MD, 
  album_release_year = ifelse(Explicit_MD$album_release_year == 1990, "1990",
                              ifelse(Explicit_MD$album_release_year == 1991, "1991",
                                     ifelse(Explicit_MD$album_release_year == 1992, "1992",
                                            ifelse(Explicit_MD$album_release_year == 1993, "1993",
                                                   ifelse(Explicit_MD$album_release_year == 1994, "1994",
                                                          ifelse(Explicit_MD$album_release_year == 1995, "1995",
                                                                 ifelse(Explicit_MD$album_release_year == 1996, "1996",
                                                                        ifelse(Explicit_MD$album_release_year == 1997, "1997",
                                                                               ifelse (Explicit_MD$album_release_year == 1998, "1998",
                                                                               ifelse (Explicit_MD$album_release_year == 1999, "1999",
                                                                               ifelse (Explicit_MD$album_release_year == 2000, "2000",
                                                                               "na"))))))))))))

# PITBULL

Explicit_PB <- PITBULL %>% 
  filter %>% 
  select(track_name, album_release_year, explicit)

Explicit_PB = mutate(
  Explicit_PB, 
  album_release_year = ifelse(Explicit_PB$album_release_year == 2000, "2000",
                          ifelse(Explicit_PB$album_release_year == 2001, "2001",
                                 ifelse(Explicit_PB$album_release_year == 2002, "2002",
                                        ifelse(Explicit_PB$album_release_year == 2003, "2003",
                                               ifelse(Explicit_PB$album_release_year == 2004, "2004",
                                                      ifelse(Explicit_PB$album_release_year == 2005, "2005",
                                                             ifelse(Explicit_PB$album_release_year == 2006, "2006",
                                                                    ifelse(Explicit_PB$album_release_year == 2007, "2007",
                                                                           ifelse(Explicit_PB$album_release_year == 2008, "2008",
                                                                                  ifelse(Explicit_PB$album_release_year == 2009, "2009",
                                                                                         ifelse(Explicit_PB$album_release_year == 2010, "2010",
                                                                                                "na"))))))))))))
                    
#DRAKE


Explicit_DR<- DRAKE %>% 
  filter %>% 
  select(track_name, album_release_year, explicit)

Explicit_DR = mutate(
  Explicit_DR, 
  album_release_year = ifelse(Explicit_DR$album_release_year == 2010, "2010",
                              ifelse(Explicit_DR$album_release_year == 2011, "2011",
                                     ifelse(Explicit_DR$album_release_year == 2012, "2012",
                                            ifelse(Explicit_DR$album_release_year == 2013, "2013",
                                                   ifelse(Explicit_DR$album_release_year == 2014, "2014",
                                                          ifelse(Explicit_DR$album_release_year == 2015, "2015",
                                                                 ifelse(Explicit_DR$album_release_year == 2016, "2016",
                                                                        ifelse(Explicit_DR$album_release_year == 2017, "2017",
                                                                               ifelse(Explicit_DR$album_release_year == 2018, "2018",
                                                                                      ifelse(Explicit_DR$album_release_year == 2019, "2019",
                                                                                             ifelse(Explicit_DR$album_release_year == 2020, "2020",
                                                                                                    "na"))))))))))))

                      