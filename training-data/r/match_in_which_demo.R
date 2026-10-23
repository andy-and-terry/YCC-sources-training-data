# match(), %in%, and which() for locating elements.

x <- c("b", "z", "a", "b", "q")
table_ <- c("a", "b", "c")

print(match(x, table_))            # position in table_, NA if absent
print(x %in% table_)               # logical membership
print(match(x, table_, nomatch = 0L))

# Subset using %in% and negate it for the complement.
print(x[x %in% table_])
print(x[!(x %in% table_)])

# which() returns indices of TRUE; names are preserved.
v <- c(a = 5, b = 12, c = 7, d = 20)
print(which(v > 6))
print(which.max(v))
print(which.min(v))

# arr.ind gives row/column coordinates for matrices.
m <- matrix(c(1, 9, 4, 8, 2, 7), nrow = 2)
print(which(m > 5, arr.ind = TRUE))

# Lookup table idiom: map codes to labels via match.
codes  <- c("S", "M", "L", "M")
levels_ <- c(S = "small", M = "medium", L = "large")
print(unname(levels_[match(codes, names(levels_))]))
