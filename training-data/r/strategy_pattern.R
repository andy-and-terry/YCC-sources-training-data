# Strategies are just functions passed as values -- no interface
# boilerplate needed in R.
add_strategy <- function(a, b) a + b
multiply_strategy <- function(a, b) a * b
max_strategy <- function(a, b) max(a, b)

apply_strategy <- function(strategy, a, b) {
  strategy(a, b)
}

for (strategy in list(add_strategy, multiply_strategy, max_strategy)) {
  print(apply_strategy(strategy, 4, 7))
}
