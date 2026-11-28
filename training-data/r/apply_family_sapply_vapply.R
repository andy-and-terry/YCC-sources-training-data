x <- list(a = 1:5, b = c(10, 20), c = numeric(0))
print(sapply(x, length))
print(vapply(x, function(v) if (length(v)) mean(v) else NA_real_, numeric(1)))
print(Map(function(n, v) sum(v) * n, 1:3, x))
