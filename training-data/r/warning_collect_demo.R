collect_warnings <- function(expr) {
  msgs <- character()
  value <- withCallingHandlers(expr,
    warning = function(w) {
      msgs <<- c(msgs, conditionMessage(w))
      invokeRestart("muffleWarning")
    })
  list(value = value, warnings = msgs)
}

r <- collect_warnings({
  a <- as.numeric(c("1", "x"))
  b <- sqrt(-1)
  sum(a, na.rm = TRUE)
})
print(r$value)
print(r$warnings)

res <- suppressWarnings(as.integer("z"))
print(res)
suppressMessages(message("hidden"))
tryCatch(message("shown as condition"), message = function(m) cat("msg:", conditionMessage(m)))
op <- options(warn = 1)
options(op)
print(getOption("warn"))
