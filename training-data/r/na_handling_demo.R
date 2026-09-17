values <- c(10, NA, 20, NA, 30)

print(is.na(values))
print(sum(values, na.rm = TRUE))
print(mean(values, na.rm = TRUE))

clean <- values[!is.na(values)]
print(clean)

filled <- ifelse(is.na(values), 0, values)
print(filled)

df <- data.frame(x = c(1, NA, 3), y = c(NA, 5, 6))
print(complete.cases(df))
print(na.omit(df))

coalesce <- function(...) {
  Reduce(function(a, b) ifelse(is.na(a), b, a), list(...))
}
print(coalesce(c(NA, 2, NA), c(1, NA, 3)))
