# on.exit for cleanup and withCallingHandlers to log warnings without
# aborting the computation.
process <- function() {
  cat("opening resource\n")
  on.exit(cat("closing resource\n"), add = TRUE)
  stop("something failed")
}

result <- tryCatch(process(), error = function(e) conditionMessage(e))
print(result)

collected <- character()
value <- withCallingHandlers(
  {
    as.numeric(c("1", "x", "3"))
  },
  warning = function(w) {
    collected <<- c(collected, conditionMessage(w))
    invokeRestart("muffleWarning")
  }
)
print(value)
print(collected)

res <- tryCatch(
  { warning("careful"); "not reached" },
  warning = function(w) "caught warning",
  finally = cat("finally runs\n")
)
print(res)
