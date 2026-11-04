gcd <- function(a, b) if (b == 0) abs(a) else gcd(b, a %% b)

gcd_all <- function(...) Reduce(gcd, c(...), accumulate = FALSE, 0)

print(gcd_all(12, 18, 24))
print(gcd_all(7, 13))
