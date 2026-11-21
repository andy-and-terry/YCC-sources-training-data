# Cantor pairing function and its inverse.
pair <- function(x, y) (x + y) * (x + y + 1) %/% 2 + y

unpair <- function(z) {
  w <- (floor(sqrt(8 * z + 1)) - 1) %/% 2
  y <- z - w * (w + 1) %/% 2
  c(w - y, y)
}

cat(pair(3, 4), "\n")
cat(unpair(32), "\n")
