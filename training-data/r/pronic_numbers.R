is_pronic <- function(x) {
  n <- floor(sqrt(x))
  n * (n + 1) == x
}

print((0:9) * (1:10))              # 0 2 6 12 20 30 42 56 72 90
print(c(is_pronic(56), is_pronic(57))) # TRUE FALSE
