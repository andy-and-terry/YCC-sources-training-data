x <- c(3, 1, 4, 1, 5, 9, 2, 6)

print(cumsum(x))
print(cumprod(1:6))
print(cummax(x))
print(cummin(x))
print(diff(x))
print(diff(x, lag = 2))
print(rev(cumsum(rev(x))))

moving_average <- function(v, k) {
  stats::filter(v, rep(1 / k, k), sides = 2)
}
print(as.numeric(moving_average(x, 3)))

growth <- 100 * cumprod(rep(1.05, 5))
print(round(growth, 2))
print(Reduce(`+`, x, accumulate = TRUE))
print(rle(c(1, 1, 2, 2, 2, 3)))
