# Emirps: primes whose digit reversal is a different prime.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) {
    if (n %% d == 0) return(FALSE)
    d <- d + 1
  }
  TRUE
}
rev_num <- function(n) as.integer(paste(rev(strsplit(as.character(n), "")[[1]]), collapse = ""))
out <- Filter(function(n) { r <- rev_num(n); r != n && is_prime(n) && is_prime(r) }, 2:199)
cat(out, "\n")
