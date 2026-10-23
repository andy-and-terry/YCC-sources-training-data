# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
# R numbers are doubles, so only the first 6 terms are exact integers.
s <- 2
for (i in 0:5) {
  cat(sprintf("s(%d) = %.0f\n", i, s))
  s <- s * s - s + 1
}
