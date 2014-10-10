require(ggplot2)
require(plyr)

get.spline.info <- function(spline) {
  with(spline, {
    data.frame(x=x,y=y,df=df)
  })
}

data(diamonds)

with(diamonds, {
  #single spline graph
  spline <- smooth.spline(x=carat, y=price, df=5)
  splineDF <- ldply(list(spline), get.spline.info)
  g <- ggplot(diamonds, aes(x=carat,y=price)) + geom_point() + geom_line(data=splineDF, aes(x=x,y=y,color=factor(round(df,0))))
  g + scale_color_discrete("Degrees of \nFreedom")
  
  #multi spline graph
  spline3 <- smooth.spline(x=carat, y=price, df=2)
  spline4 <- smooth.spline(x=carat, y=price, df=3)
  spline5 <- smooth.spline(x=carat, y=price, df=10)
  spline6 <- smooth.spline(x=carat, y=price, df=50)
  splineDF <- ldply(list(spline, spline3,spline4,spline5,spline6), get.spline.info)
  g <- ggplot(diamonds, aes(x=carat,y=price)) + geom_point() + geom_line(data=splineDF, aes(x=x,y=y,color=factor(round(df,0))))
  g + scale_color_discrete("Degrees of \nFreedom")
})
