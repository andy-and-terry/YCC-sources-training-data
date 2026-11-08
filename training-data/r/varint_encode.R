varint <- function(n) {
  out <- integer()
  while (n >= 128) {
    out <- c(out, bitwOr(n %% 128, 128))
    n <- n %/% 128
  }
  c(out, n)
}
print(as.hexmode(varint(300)))
