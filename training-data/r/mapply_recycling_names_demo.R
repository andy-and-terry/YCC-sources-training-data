# mapply walks several vectors in parallel, recycling shorter ones,
# and keeps names when the first argument is a named/character vector.

sums <- mapply(function(x, y) x + y, 1:6, c(10, 20))
print(sums)  # c(10, 20) is recycled three times

# Extra constant arguments go through MoreArgs.
print(mapply(rep, times = 1:3, MoreArgs = list(x = "a")))

# USE.NAMES: a character first argument becomes the result names.
greet <- mapply(function(name, n) paste(rep(name, n), collapse = "-"),
                c("ab", "cd"), c(2, 3))
print(greet)

# SIMPLIFY = FALSE always returns a list.
lst <- mapply(function(a, b) a:b, 1:3, 3:5, SIMPLIFY = FALSE)
str(lst)

# Map() is the thin wrapper that never simplifies.
res <- Map(function(k, v) sprintf("%s=%d", k, v),
           c("x", "y", "z"), c(1L, 2L, 3L))
print(unlist(res))
