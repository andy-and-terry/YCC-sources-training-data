# Repunits: numbers made only of the digit 1.
r <- 0
out <- numeric(5)
for (i in 1:5) {
  r <- r * 10 + 1
  out[i] <- r
}
print(out)
