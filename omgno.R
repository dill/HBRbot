### post some terrible HBR diagrams to the popular microblogging
###  platform twitter dot com

# David Lawrence Miller 2018



# yeah...

#devtools::install_github("CerebralMastication/hbrplot")

library('hbrplot')
library(ggplot2)

setwd("~/hbrbot.R")

load("thingos.RData")

samps <- sample(1:length(thingos), 4, replace=FALSE)

items <- thingos[[samps[1]]]
items <- items[sample(1:length(items), 9)]

quadrants <- thingos[[samps[2]]]
quadrants <- quadrants[sample(1:length(quadrants), 4)]

xlabs <- thingos[[samps[3]]]
xlabs <- xlabs[sample(1:length(xlabs), 2)]

ylabs <- thingos[[samps[4]]]
ylabs <- ylabs[sample(1:length(ylabs), 2)]


p <- hbrplot(
  items = items,
  quadrants = quadrants,
  x_labels = xlabs,
  y_labels = ylabs
)

#print(p)
fn <- paste0("posts/hbr_", format(Sys.time(), "%d%b%Y-%H%M"), ".png")

ggsave(p, file=fn, width=8, height=8)


post_it <- function(fn){
  # how to from here:
  # https://github.com/twitter/twurl/issues/58
  fuzzy_dog <- system2("/usr/local/bin/twurl",
                  paste0("-H upload.twitter.com \"/1.1/media/upload.json\" -f ",
                         fn,
                         " -F media -X POST"), stdout=TRUE)

  fuzzy_dog <- sub(".*\"media_id\":(\\d+).*", "\\1", fuzzy_dog)
  cat(fuzzy_dog,"\n")
  fuzzy_dog2 <- system2("/usr/local/bin/twurl",
                        paste0("\"/1.1/statuses/update.json\" -d \"media_ids=",
                               fuzzy_dog,
                               "&status=\""))
}

post_it(fn)

