install.packages("gRbase")
install.packages("graph", repos = "http://cran.us.r-project.org")


library(igraph)
library(graph)
library(gRbase)
library(bnlearn)

data(cad1)
cad = cad1

## (A) ##

cad_box <- c(1, 3, 3, 4, 4, 4, 4, 1, 2, 1, 1, 1, 3, 2) 
bm <- matrix(0, nrow = 14, ncol = 14)
rownames(bm) <- names(cad)
colnames(bm) <- names(cad)

for (b in 2:4) {
  bm[which(block == b), which(cad_box < b)] <- 1
}

BL <- data.frame(from = character(), to = character())
for (i in 1:nrow(bm)) {
  for (j in 1:ncol(bm)) {
    if (bm[i, j] == 1) {
      BL <- rbind(BL, data.frame(from = rownames(bm)[i], to = colnames(bm)[j]))
    }
  }
}

cad.bn2 <- hc(cad1, blacklist = BL)
net.constr <- as(amat(cad.bn2), "graphNEL")
plot(net.constr)


## (B) ##

bfit = bn.fit(cad.bn2 , cad1)
dsep(cad.bn2 , 'Sex' , 'SuffHeartF' , 'Smoker')
dsep(cad.bn2 , 'Sex' , 'SuffHeartF' , 'Smoker')
dsep(cad.bn2 , 'Sex' , 'SuffHeartF' , 'Smoker')
dsep(cad.bn2 , 'AngPec' , 'QWave' , 'CAD')

## (D) ##
cpquery(bfit, event = (CAD == "Yes"), evidence = (QWave == "Yes" & AMI == "Definite"))

