require(UsingR)
require(ggplot)

#linear regression graph
g <- ggplot(father.son, aes(x=fheight,y=sheight)) + geom_point() + labs(x="Father's Height",y="Son's Height")
g <- g + geom_smooth(method="lm")
g

#linear regression coefficients
summary(lm(formula = sheight~fheight, data=father.son))