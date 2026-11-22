# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
is_practical <- function(n) {
  reach <- 0
  for (d in which(n %% 1:n == 0)) reach <- union(reach, reach + d)
  all(1:n %in% reach)
}
cat(Filter(is_practical, 1:40), "\n")
