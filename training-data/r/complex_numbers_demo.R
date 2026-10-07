z1 <- complex(real = 3, imaginary = 4)
z2 <- 1 - 2i

print(z1 + z2)
print(z1 * z2)
print(Mod(z1))
print(Conj(z1))
print(Re(z1))
print(Im(z1))
print(Arg(1i))

roots <- polyroot(c(1, 0, 1))  # x^2 + 1 = 0 -> +/- i
print(roots)

mandelbrot_escapes <- function(c, max_iter = 50) {
  z <- 0 + 0i
  for (i in seq_len(max_iter)) {
    z <- z^2 + c
    if (Mod(z) > 2) return(i)
  }
  max_iter
}

print(mandelbrot_escapes(complex(real = 0.3, imaginary = 0.5)))
print(mandelbrot_escapes(complex(real = -1, imaginary = 0)))
