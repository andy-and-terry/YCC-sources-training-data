tau <- function(n) sum(n %% 1:n == 0)
ns <- Filter(function(n) n %% tau(n) == 0, 1:59)
cat(ns, "\n") # 1 2 8 9 12 18 24 36 40 56
