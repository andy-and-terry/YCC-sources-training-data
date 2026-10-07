# `...` collects any number of extra arguments, match.arg() validates a
# choice against a fixed set of options, and do.call() invokes a function
# with an argument list built at runtime.
summarize_numbers <- function(..., stat = c("sum", "mean", "max")) {
  stat <- match.arg(stat)
  values <- c(...)
  switch(stat,
    sum = sum(values),
    mean = mean(values),
    max = max(values)
  )
}

cat("sum:", summarize_numbers(1, 2, 3, 4, stat = "sum"), "\n")
cat("mean:", summarize_numbers(1, 2, 3, 4, stat = "mean"), "\n")

result <- tryCatch(
  summarize_numbers(1, 2, stat = "median"),
  error = function(e) conditionMessage(e)
)
cat("invalid stat rejected:", result, "\n")

call_args <- list(1, 2, 3, 4, stat = "max")
cat("via do.call:", do.call(summarize_numbers, call_args), "\n")
