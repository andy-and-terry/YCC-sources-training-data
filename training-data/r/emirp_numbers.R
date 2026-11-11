# Emirps: primes whose digit reversal is a different prime.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  if (n < 4) return(TRUE)
  all(n %% 2:floor(sqrt(n)) != 0)
}

reverse_digits <- function(n) {
  as.numeric(paste(rev(strsplit(as.character(n), "")[[1]]), collapse = ""))
}

emirps <- Filter(function(n) {
  r <- reverse_digits(n)
  r != n && is_prime(n) && is_prime(r)
}, 2:99)
print(emirps)
