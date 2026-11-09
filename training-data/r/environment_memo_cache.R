cache <- new.env()
memo_fib <- function(n) {
  key <- as.character(n)
  if (!is.null(cache[[key]])) return(cache[[key]])
  v <- if (n < 2) n else memo_fib(n - 1) + memo_fib(n - 2)
  cache[[key]] <- v
  v
}
print(memo_fib(40))
