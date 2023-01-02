#Removing observations that do not fall within the selected decade

Explicit_PR <- subset(Explicit_PR, album_release_year != "na" )
Explicit_MD <- subset(Explicit_MD, album_release_year != "na" )
Explicit_PB <- subset(Explicit_PB, album_release_year != "na" )
Explicit_DR <- subset(Explicit_DR, album_release_year != "na" )

Explicit_PR = subset(Explicit_PR, select = -c(track_name))
Explicit_MD = subset(Explicit_MD, select = -c(track_name))
Explicit_PB = subset(Explicit_PB, select = -c(track_name))
Explicit_DR = subset(Explicit_DR, select = -c(track_name))


Explicit_PR = mutate(
  Explicit_PR, 
  explicit = ifelse(Explicit_PR$explicit == TRUE, 1,
                    0))

Explicit_MD = mutate(
  Explicit_MD, 
  explicit = ifelse(Explicit_MD$explicit == TRUE, 1,
                     0))

Explicit_PB = mutate(
  Explicit_PB, 
  explicit = ifelse(Explicit_PB$explicit == TRUE, 1,
                    0))

Explicit_DR = mutate(
  Explicit_DR, 
  explicit = ifelse(Explicit_DR$explicit == TRUE, 1,
                    0))
