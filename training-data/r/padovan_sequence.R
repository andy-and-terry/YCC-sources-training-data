# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
padovan <- function(count) {
  p <- rep(1, count)
  for (i in seq_len(count)[-(1:3)]) p[i] <- p[i - 2] + p[i - 3]  # 1-based
  p
}

cat(padovan(15), "\n")
