# Bulls and Cows scoring for equal-length digit strings.
score <- function(secret, guess) {
  s <- strsplit(secret, "")[[1]]
  g <- strsplit(guess, "")[[1]]
  same <- s == g
  bulls <- sum(same)
  sc <- table(s[!same])
  gc <- table(g[!same])
  common <- intersect(names(sc), names(gc))
  cows <- sum(pmin(sc[common], gc[common]))
  c(bulls = bulls, cows = cows)
}

res <- score("1807", "7810")
cat(res[["bulls"]], "bull(s),", res[["cows"]], "cow(s)\n")
