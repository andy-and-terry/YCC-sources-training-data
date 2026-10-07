x <- c(-2, 0, 3, NA, 7)

print(ifelse(x > 0, "positive", "non-positive"))
print(ifelse(is.na(x), 0, x))
print(ifelse(x > 0, x, -x))

sign_label <- ifelse(x > 0, "pos", ifelse(x < 0, "neg", "zero"))
print(sign_label)

classify <- function(n) {
  if (is.na(n)) {
    "missing"
  } else if (n < 0) {
    "negative"
  } else if (n == 0) {
    "zero"
  } else {
    "positive"
  }
}
print(vapply(x, classify, character(1)))

# if() requires a single logical; this errors for vectors
res <- tryCatch(if (x > 0) "yes", error = function(e) "error: condition length > 1")
print(res)

print(if (FALSE) "never")
print(is.null(if (FALSE) "never"))

y <- if (length(x) > 3) "long" else "short"
print(y)

print(switch("b", a = "first", b = "second", "other"))
print(isTRUE(c(TRUE, TRUE)))
print(any(x > 5, na.rm = TRUE))
print(all(x > -5, na.rm = TRUE))
print(xor(TRUE, FALSE))
print(TRUE && NA)
print(FALSE && NA)
