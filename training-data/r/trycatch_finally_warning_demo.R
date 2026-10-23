# tryCatch with separate warning/error handlers and finally.

parse_num <- function(s) {
  tryCatch({
    n <- as.numeric(s)           # warns on bad input
    if (is.na(n)) stop("not a number")
    n
  },
  warning = function(w) {
    cat("  warning caught:", conditionMessage(w), "\n")
    NA_real_
  },
  error = function(e) {
    cat("  error caught:", conditionMessage(e), "\n")
    NA_real_
  },
  finally = cat("  done parsing", shQuote(s), "\n"))
}

print(parse_num("3.14"))
print(parse_num("abc"))

# withCallingHandlers keeps going after a warning.
res <- withCallingHandlers({
  warning("first")
  "completed anyway"
}, warning = function(w) {
  cat("logged:", conditionMessage(w), "\n")
  invokeRestart("muffleWarning")
})
print(res)

# try() with silent = TRUE returns a classed object instead of stopping.
r <- try(log(-1:1), silent = TRUE)
print(r)
r2 <- try(stop("boom"), silent = TRUE)
cat("class:", class(r2), "\n")
