is_prime <- function(n) {
  if (n < 2) return(FALSE)
  for (i in 2:floor(sqrt(n))) {
    if (n %% i == 0) return(FALSE)
  }
  TRUE
}

primes <- Filter(is_prime, 2:20)
print(primes)
