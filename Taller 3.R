# Integrantes
## Jorge Higuera 
## Andres Rodriguez 
## Hugo Fonseca 
## Danny Buitrago 


library(tidyverse)
base <- read.csv("songs_normalize.csv")


### P.1

g1 <- ggplot(Spotify, aes(x = danceability, y = valence)) +
  geom_point(color = "blue", alpha = 0.3)


### P.2

g2 <- ggplot(Spotify, aes(x = as.factor(mode), y = energy, color = as.factor(mode))) +
  geom_boxplot(show.legend = FALSE)


### P.3

install.packages("patchwork")
library(patchwork)
g1+g2
