require(ggplot2)

data(diamonds)

diamonds <- diamonds[diamonds$z < 5,]
diamonds <- diamonds[diamonds$z > 2.5,]

diamonds$color <- as.character(diamonds$color)
diamonds$color[diamonds$color == "D"] <- "red"
diamonds$color[diamonds$color == "E"] <- "blue"
diamonds$color[diamonds$color == "F"] <- "green"
diamonds$color[diamonds$color == "G"] <- "purple"
diamonds$color[diamonds$color == "H"] <- "pink"
diamonds$color[diamonds$color == "I"] <- "yellow"
diamonds$color[diamonds$color == "J"] <- "orange"

with(diamonds, {
  scatterplot3d::scatterplot3d(x,y,z,main="3D Scatter Plot",color=color)
})