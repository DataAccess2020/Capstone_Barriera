
#HYPOTHESIS
# TIKTOK has become a huge phenomenon in the last 2/3 years,
# thanks to the app some artists trended at world wide level with
# their songs. The idea behind the project is to take two main playlists 
# - Top Hits and Tiktok trending - and compare the hit, trying to see how
# many tiktok's trending hits made it to the top hits.
# The starting hypothesis is that tiktok became a trendsetter in 
# matter of music and neW/old artists.

#exporting playlists

# tiktok trending -----------------

TIKTOK_trending_2022 <- 'https://open.spotify.com/playlist/4wT3RovtJTBRjCS5pIrPU7?si=80fada2d765545da' %>%
  str_remove(., 'https://open.spotify.com/playlist/')

url_tiktoktrend22 <- str_c('https://api.spotify.com/v1/playlists/', TIKTOK_trending_2022, '/tracks')

tracks_tiktok<- GET(url = url_tiktoktrend22,
                 config = add_headers(authorization = token))
tracks_tiktok <- httr::content(tracks_tiktok)
tracks_id_tiktok <- vector(length = 167) %>% 
  for (i in 1:167)  {
    tracks_id_tiktok[[i]] = tracks_tiktok$items[[i]]$track$id
  }

# top hits -------


TOPHITS_2022 <- 'https://open.spotify.com/playlist/7kXId9O5f13vCcLVISaoSk?si=ad38f138479d4384' %>%
  str_remove(., 'https://open.spotify.com/playlist/')

url_tophits22 <- str_c('https://api.spotify.com/v1/playlists/', TOPHITS_2022, '/tracks')

tracks_tophits<- GET(url = url_tophits22,
                    config = add_headers(authorization = token))
tracks_tophits <- httr::content(tracks_tophits)
tracks_id_tophits <- vector(length = 45) %>% 
  for (i in 1:45)  {
  tracks_id_tophits[[i]] = tracks_tophits$items[[i]]$track$id
}

