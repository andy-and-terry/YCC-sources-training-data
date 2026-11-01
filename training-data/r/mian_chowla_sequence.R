# Greedy sequence whose pairwise sums are all distinct.
seq_out <- c()
sums <- c()
cand <- 1
while (length(seq_out) < 8) {
  fresh <- c(seq_out, cand) + cand
  if (!anyDuplicated(fresh) && !any(fresh %in% sums)) {
    seq_out <- c(seq_out, cand)
    sums <- c(sums, fresh)
  }
  cand <- cand + 1
}
cat(seq_out, "\n")
