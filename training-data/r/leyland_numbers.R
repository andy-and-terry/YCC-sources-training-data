# Leyland numbers: x^y + y^x for x >= y >= 2.
vals <- c()
for (x in 2:4) {
  for (y in 2:x) {
    vals <- c(vals, x^y + y^x)
  }
}
cat(vals, "\n")
