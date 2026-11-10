sigma <- function(n) sum((1:n)[n %% 1:n == 0])
ns <- Filter(function(n) sigma(sigma(n)) == 2 * n, 1:99)
cat(ns, "\n") # 2 4 16 64
