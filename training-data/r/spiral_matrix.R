spiral <- function(m) {
  out <- c()
  while (nrow(m) > 0 && ncol(m) > 0) {
    out <- c(out, m[1, ])
    m <- m[-1, , drop = FALSE]
    if (nrow(m) == 0) break
    # rotate remaining matrix counter-clockwise
    m <- t(m)[ncol(m):1, , drop = FALSE]
  }
  out
}

g <- matrix(1:9, nrow = 3, byrow = TRUE)
print(spiral(g))   # 1 2 3 6 9 8 7 4 5
print(spiral(matrix(1:8, nrow = 2, byrow = TRUE)))
