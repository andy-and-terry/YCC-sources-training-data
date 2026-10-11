x <- c()
for (i in 1:length(x)) cat("buggy iteration", i, "\n")

for (i in seq_along(x)) cat("never runs\n")
print(seq_len(0))
print(seq_len(3))

v <- c(10, 20, 30)
for (i in seq_along(v)) cat(i, "->", v[i], "\n")
for (nm in names(c(a = 1, b = 2))) cat("name:", nm, "\n")
print(seq(10, 1, by = -3))
print(seq(0, 1, length.out = 5))
print(rev(seq_len(4)))
print(vapply(seq_along(v), function(i) v[i] * i, numeric(1)))
