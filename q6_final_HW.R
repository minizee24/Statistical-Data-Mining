install.packages("glasso")

library(glasso)


data("state")
statedata=state.x77
dim(statedata)

summary(statedata)

statedata = scale(statedata)
summary(statedata)

somgrid <- somgrid(xdim = 5, ydim = 5, topo = "hexagonal")
som_statedata <- som(statedata, grid = somgrid, rlen = 3000)

plot(som_statedata, type = "codes", bgcol = som_statedata$codes)

d <- dist(statedata)
print(dim(as.matrix(d)))
hc <- hclust(d, method = "ave")

plot(hc, hang = -1)

s <- c()
for (i in 2:10){
  ct <- cutree(hc, k=i)
  sil <- silhouette(ct, dist = d)
  avg_w <- summary(sil)$avg.width
  s <- c(s, avg_w)
}
s

scluster <- cutree(hc, h = 2)

plot(statedatasom, type = "mapping", col = "black")
add.cluster.boundaries(som_statedata, scluster)

statedata2 <- cov.wt(statedata, method = "ML")

S <- statedata2$cov
m0.lasso <- glasso(S, rho = 0.6) ## Regularization parameter
my.edges <- m0.lasso$wi != 0
diag(my.edges) <- 0
g.lasso <- as(my.edges, "graphNEL")
nodes(g.lasso) <- colnames(statedata)

plot(g.lasso)

