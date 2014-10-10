require(UsingR)
require(ggplot2)
require(coefplot)

data(diamonds)

with(diamonds, {
  r <- lm(price~carat+depth+table)
  coefplot(r)
})