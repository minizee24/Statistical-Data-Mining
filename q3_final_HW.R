install.packages("kohonen")
library(kohonen)


red <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv", sep = ";")
white <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", sep = ";")

red$type = "red"
whitf$type = "blue" ### naming blue as plotting will be visible
winelable <- rbind(red, white)
wine = winelable[,1:12]

wine = scale(wine)

## (A) ##

somgrid <- somgrid(xdim = 4, ydim = 5, topo = "hexagonal")
wine_som <- som(wine, grid = somgrid, rlen = 3000)

plot(wine_som , type = 'mapping' , col = winelable$type)

## (B) ##

codes <- wine_som$codes[[1]]

for (i in 1:12) {
  plot(wine_som, type = "property", property = codes[,i], main = colnames(codes)[i])
  print(colnames(codes)[i])
}

## (C) ##

som.hc <- cutree(hclust(object.distances(wine_som, "codes")), 6)
plot(wine_som , type = 'mapping' , col = winelable$type)
add.cluster.boundaries(wine_som, som.hc)


    