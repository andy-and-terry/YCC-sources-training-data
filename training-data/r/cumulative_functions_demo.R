x <- c(3, 1, 4, 1, 5, 9, 2, 6)

print(cumsum(x))
print(cumprod(1:6))
print(cummax(x))
print(cummin(x))

print(diff(x))
print(diff(cumsum(x)))
print(diff(x, lag = 2))
print(diff(c(1, 4, 9, 16, 25), differences = 2))

running_mean <- cumsum(x) / seq_along(x)
print(round(running_mean, 3))

window <- 3
moving_sum <- cumsum(x)[window:length(x)] - c(0, cumsum(x)[seq_len(length(x) - window)])
print(moving_sum)

returns <- c(0.10, -0.05, 0.02)
print(cumprod(1 + returns) - 1)

print(Reduce(`+`, x, accumulate = TRUE))
print(rev(cumsum(rev(x))))

flags <- c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE)
runs <- rle(flags)
print(runs$lengths[runs$values])
print(max(runs$lengths[runs$values]))
print(which(cumsum(x) > 10)[1])
