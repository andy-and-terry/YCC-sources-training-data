is_prime <- function(n) n > 1 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)

p <- Filter(is_prime, 2:50)
idx <- which(diff(p) == 2)
print(cbind(p[idx], p[idx + 1]))
