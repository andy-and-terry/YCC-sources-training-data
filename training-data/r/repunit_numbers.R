# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
r <- 0
out <- numeric(8)
for (i in 1:8) {
  r <- r * 10 + 1
  out[i] <- r
}
cat(format(out, scientific = FALSE, trim = TRUE), "\n")
