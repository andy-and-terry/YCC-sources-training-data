res <- tryCatch({
  warning("careful")
}, warning = function(w) {
  paste("warn:", conditionMessage(w))
}, error = function(e) {
  "error"
}, finally = cat("finished\n"))
print(res)
