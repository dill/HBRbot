`hbrbot` - a bot to make stupid graphs
======================================

Source for [`@hbrplotbot`](https://twitter.com/hbrplotbot), which is a twitter bot that makes stupid plots like this:

![a silly plot](hbrexample.png)

Other people did the hard work...

- [`hbrplot`](https://github.com/CerebralMastication/hbrplot)
- [`corpora`](https://github.com/dariusk/corpora)



### Generating the header/avatar

```r
library('hbrplot')

hbrplot(
  items = rep("HBR", 9),
  quadrants = rep("Ignore", 4),
  x_labels = c("Harvard", "Business"),
  y_labels = c("Business", "Review")
)
```

