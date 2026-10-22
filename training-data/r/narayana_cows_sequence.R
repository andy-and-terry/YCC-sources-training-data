# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
n <- c(1, 1, 1)
for (i in 4:15) n[i] <- n[i - 1] + n[i - 3]
cat(n, "\n")
