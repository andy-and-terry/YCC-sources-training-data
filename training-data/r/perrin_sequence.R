# Perrin sequence P(n)=P(n-2)+P(n-3)
v <- c(3, 0, 2)
for (i in 4:10) v[i] <- v[i - 2] + v[i - 3]
cat(v, "\n")
