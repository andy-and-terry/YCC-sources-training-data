print(1:6 + 1:2)
print(1:6 * c(1, 10, 100))
print(c(1, 2, 3, 4) > 2)

res <- withCallingHandlers(
  1:5 + 1:2,
  warning = function(w) {
    cat("warning caught:", conditionMessage(w), "\n")
    invokeRestart("muffleWarning")
  }
)
print(res)

v <- numeric(0)
print(v + 1)
print(sum(v))
print(length(NULL))

x <- 1:10
x[x %% 2 == 0] <- 0L
print(x)

x[15] <- 99L
print(x)

m <- matrix(0, nrow = 2, ncol = 3)
m[] <- 1:2
print(m)

print(rep(c("a", "b"), times = 3))
print(rep(c("a", "b"), each = 2))
print(rep_len(1:3, 8))
print(rep(1:2, times = c(3, 1)))

print(seq(10, 1, by = -3))
print(seq_len(0))
print(head(letters, -23))
print(tail(1:10, 3))
print(append(1:3, 99, after = 1))
