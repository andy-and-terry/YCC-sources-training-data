# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
is_hamming <- function(n) {
  for (p in c(2, 3, 5)) while (n %% p == 0) n <- n / p
  n == 1
}

found <- Filter(is_hamming, 1:100)[1:20]
cat(found, "\n")
