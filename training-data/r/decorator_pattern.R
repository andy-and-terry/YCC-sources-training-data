# Functional decorators: wrap a function to add behavior without
# modifying its definition.
with_logging <- function(f) {
  function(...) {
    cat("calling with args:", paste(list(...), collapse = ", "), "\n")
    result <- f(...)
    cat("result:", result, "\n")
    result
  }
}

with_timing <- function(f) {
  function(...) {
    start <- Sys.time()
    result <- f(...)
    elapsed <- as.numeric(Sys.time() - start, units = "secs")
    cat("elapsed:", elapsed, "seconds\n")
    result
  }
}

add <- function(a, b) a + b
decorated_add <- with_timing(with_logging(add))

decorated_add(3, 4)
