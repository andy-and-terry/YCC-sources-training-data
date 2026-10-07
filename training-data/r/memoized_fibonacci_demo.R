make_memoized_fib <- function() {
  cache <- new.env()

  fib <- function(n) {
    key <- as.character(n)
    if (!is.null(cache[[key]])) return(cache[[key]])

    result <- if (n <= 1) n else fib(n - 1) + fib(n - 2)
    cache[[key]] <- result
    result
  }
  fib
}

memo_fib <- make_memoized_fib()
print(sapply(0:15, memo_fib))
print(memo_fib(30))
