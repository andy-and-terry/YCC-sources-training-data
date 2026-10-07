# table() for counting and cross-tabulating categorical data.
colors <- c("red", "blue", "red", "green", "blue", "red")
sizes  <- c("S", "M", "S", "L", "L", "M")

counts <- table(colors)
print(counts)
print(names(counts)[counts == max(counts)])
print(sort(counts, decreasing = TRUE))

cross <- table(colors, sizes)
print(cross)
print(prop.table(cross, margin = 1))
print(addmargins(cross))
