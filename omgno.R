# yeah...

#devtools::install_github("CerebralMastication/hbrplot")

library('hbrplot')

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

print(p)
