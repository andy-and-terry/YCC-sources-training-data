# Cumulative helpers and differences on numeric vectors.
sales <- c(100, 120, 90, 150, 130)

print(cumsum(sales))
print(cumprod(c(1, 2, 3, 4)))
print(cummax(sales))
print(cummin(sales))

changes <- diff(sales)
print(changes)
print(round(changes / head(sales, -1) * 100, 1))

print(diff(sales, lag = 2))

moving_avg <- stats::filter(sales, rep(1 / 3, 3), sides = 2)
print(as.numeric(moving_avg))
