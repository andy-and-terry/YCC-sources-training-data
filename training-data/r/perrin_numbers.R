# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
p <- c(3, 0, 2)
for (n in 4:15) p[n] <- p[n - 2] + p[n - 3]
cat(p, "\n")
