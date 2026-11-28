s <- utf8ToInt("abcabc"); k <- 3; B <- 31; M <- 1000003
for (i in 0:(length(s) - k)) {
  h <- 0
  for (c in s[(i + 1):(i + k)]) h <- (h * B + c) %% M
  cat(i, h, "\n")
}
