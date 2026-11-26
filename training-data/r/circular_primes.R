# Circular primes below 100; expect 13.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) { if (n %% d == 0) return(FALSE); d <- d + 1 }
  TRUE
}

circular <- function(n) {
  s <- as.character(n)
  all(sapply(seq_len(nchar(s)) - 1, function(i)
    is_prime(as.integer(paste0(substring(s, i + 1), substring(s, 1, i))))))
}
cat(sum(sapply(2:99, circular)), "\n")
