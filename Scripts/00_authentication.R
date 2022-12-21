# The first thing required is the authentication to the API 

install.packages('spotifyr')

library(spotifyr)
library(tidyverse)

Sys.setenv(SPOTIFY_CLIENT_ID = '1acdf91f2d3a4fe089539ff0d3f0392b')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'b49411cdd0834f6d85c9374c2062f371')

access_token <- get_spotify_access_token()

