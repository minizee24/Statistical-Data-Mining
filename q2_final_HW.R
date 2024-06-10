library(cluster)

red <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv", sep = ";")
white <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", sep = ";")

dim(red)

print(dim(red))
print(dim(white))

head(red)
summary(red)
plot(red)

head(white)
summary(white)
plot(white)

corrplot(cor(red))
corrplot(cor(white))

## (B) ##

pred = prcomp(red , center = TRUE , scale = TRUE)
plot(pred)

biplot(pred)

## (C) ##

pred_white = prcomp(white , center = TRUE , scale = TRUE)
plot(pred_white)

biplot(pred_white)

## (D) ##

wine <- rbind(red, white)
pred_wine = prcomp(wine, center = TRUE , scale = TRUE)
plot(pred_wine)

biplot(pred_wine)

## (E) ##

s <- c()
dis = dist(wine)
for (i in 2:10){
  k = kmeans(wine, centers = i, nstart = 10)
  sil <- silhouette(k$cluster, dist = dis)
  avg_w <- summary(sil)$avg.width
  s <- c(s, avg_w)
}

plot(s, type = 'b', main = 'Silhouette average width plot', xlab = 'K', ylab = 'Average Silhouette Distance')

km2 <- kmeans(wine, centers = 2, nstart = 10)
plot(wine, col = km2$cluster, main = "Kmeans with K = 2")

## (F) ##

pred_winedata = pred_wine$x[,1:4]

km2 <- kmeans(pred_winedata, centers = 2, nstart = 10)
plot(pred_winedata, col = km2$cluster+1, main = "Kmeans with K = 2")
points(km2$centers, pch = 8)

## (G) ##

# in the report