# The first thing required is the authentication to the API 

install.packages('spotifyr')

library(spotifyr)
library(tidyverse)
library(httr)
library(stringr)
library(cowplot)

Sys.setenv(SPOTIFY_CLIENT_ID = '1acdf91f2d3a4fe089539ff0d3f0392b')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'b49411cdd0834f6d85c9374c2062f371')

access_token <- get_spotify_access_token()

r <-  POST(
  url = 'https://accounts.spotify.com/api/token',
  accept_json(),
  body = list(grant_type = 'client_credentials',
              client_id = "1acdf91f2d3a4fe089539ff0d3f0392b",
              client_secret = "b49411cdd0834f6d85c9374c2062f371", 
              content_type = "application/x-www-form-urlencoded"),   
  encode = 'form',
  verbose()
)
cnt <- httr::content(r)
token <- str_c(cnt$token_type, cnt$access_token, sep =' ')