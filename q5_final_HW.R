nodes <- data.frame(names = c("A", "B", "C", "D" , "E" , "F"))

relations <- data.frame(
from = c("C", "B", "D", "D", "B", "E", "F"),
to = c("A", "C", "B", "E", "E", "D", "C"))
g <- graph.data.frame(relations, directed = TRUE, vertices = nodes)
plot(g)

pg <- page.rank(g, damping = .05)
pg$vector

pg <- page.rank(g, damping = .25)
pg$vector

pg <- page.rank(g, damping = .5)
pg$vector

pg <- page.rank(g, damping = .75)
pg$vector

pg <- page.rank(g, damping = .95)
pg$vector

## (b) ##

nodes <- data.frame(names = c("A", "B", "C", "D" , "E" , "F" , "G" , "H"))

relations <- data.frame(
  from = c("B", "C", "D", "E", "F", "G", "H"),
  to = c("A", "A", "B", "B", "C", "C", "C"))
g <- graph.data.frame(relations, directed = TRUE, vertices = nodes)
plot(g)

pg <- page.rank(g, damping = .25)
pg$vector

