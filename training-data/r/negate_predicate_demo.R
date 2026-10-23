# Negate() builds the logical complement of a predicate function.
is_even <- function(x) x %% 2 == 0
is_odd <- Negate(is_even)

nums <- 1:10
print(Filter(is_even, nums))
print(Filter(is_odd, nums))
print(is_odd(c(1, 2, 3)))

words <- c("apple", "", "banana", "", "cherry")
non_empty <- Filter(Negate(function(w) w == ""), words)
print(non_empty)

# Negate also works with built-in predicates
vals <- list(1, NULL, "a", NULL, 3)
print(length(Filter(Negate(is.null), vals)))
print(Position(Negate(is.numeric), vals))
print(Find(Negate(is.numeric), vals))
