is_prime <- function(n) n >= 2 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)

out <- c()
y <- 1
while (length(out) < 8) {
  p <- 3 * y^2 + 3 * y + 1
  if (is_prime(p)) out <- c(out, p)
  y <- y + 1
}
print(out)
