# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
gcd <- function(a, b) if (b == 0) a else gcd(b, a %% b)

phi <- function(n) sum(vapply(seq_len(n), function(k) gcd(k, n) == 1, logical(1)))

chain_sum <- function(m) {
  total <- 0
  while (m > 1) {
    m <- phi(m)
    total <- total + m
  }
  total
}

cat(Filter(function(n) chain_sum(n) == n, 2:199), "\n")
