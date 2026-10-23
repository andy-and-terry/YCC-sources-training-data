# formatC gives C-style control over width, flags and number format.
print(formatC(42, width = 8, flag = "0"))
print(formatC(3.14159, digits = 2, format = "f"))
print(formatC(1234567.891, format = "f", big.mark = ",", digits = 1))
print(formatC(0.000123, format = "e", digits = 2))
print(formatC(255, format = "x"))
print(formatC("left", width = -10))
print(formatC("right", width = 10))
print(formatC(c(1, 10, 100), width = 5, flag = " "))
print(formatC(5, flag = "+"))

ids <- c(7, 42, 365)
print(paste0("ID-", formatC(ids, width = 5, flag = "0")))

# format() is the higher-level alternative
print(format(c(1.5, 22.25, 333), nsmall = 2, width = 8))
print(format(TRUE))
print(format(1e6, big.mark = ",", scientific = FALSE))
