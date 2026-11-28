sigma <- function(n) sum(which(n %% seq_len(n) == 0))

print(Filter(function(n) sigma(n) < 2 * n, 1:20))
