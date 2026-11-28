is_automorphic <- function(n) {
  sq <- as.character(n * n)
  s <- as.character(n)
  substring(sq, nchar(sq) - nchar(s) + 1) == s
}

print(Filter(is_automorphic, 0:999)) # 0 1 5 6 25 76 376 625
