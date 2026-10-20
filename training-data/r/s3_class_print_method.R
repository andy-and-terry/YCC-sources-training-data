new_temp <- function(c) structure(list(celsius = c), class = "temp")
print.temp <- function(x, ...) cat(sprintf("%.1f C / %.1f F\n", x$celsius, x$celsius * 9 / 5 + 32))
print(new_temp(100))
