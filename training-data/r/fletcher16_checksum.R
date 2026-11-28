fletcher16 <- function(s) {
  s1 <- 0L
  s2 <- 0L
  for (b in as.integer(charToRaw(s))) {
    s1 <- (s1 + b) %% 255L
    s2 <- (s2 + s1) %% 255L
  }
  bitwOr(bitwShiftL(s2, 8L), s1)
}

cat(sprintf("%x\n", fletcher16("abcde")))
