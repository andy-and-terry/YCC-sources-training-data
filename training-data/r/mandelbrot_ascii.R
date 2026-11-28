escape <- function(c) {
  z <- 0+0i
  for (n in 0:29) {
    if (Mod(z) >= 2) return(n)
    z <- z * z + c
  }
  30
}
for (yi in -5:5) {
  row <- sapply(-40:12, function(xi) if (escape(complex(real = xi / 20, imaginary = yi / 5)) == 30) "#" else ".")
  cat(paste(row, collapse = ""), "\n")
}
