safe_divide <- function(a, b) {
  tryCatch(
    {
      if (b == 0) stop("division by zero")
      a / b
    },
    error = function(e) {
      cat("error:", conditionMessage(e), "\n")
      NA
    }
  )
}

print(safe_divide(10, 2))
print(safe_divide(5, 0))
