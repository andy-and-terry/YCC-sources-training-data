# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
row <- 1
out <- 1
for (i in 1:9) {
  row <- cumsum(c(0, rev(row)))
  out <- c(out, row[length(row)])
}
cat(out, "\n")
