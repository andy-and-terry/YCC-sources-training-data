res <- tryCatch({
  warning("careful")
  1
}, warning = function(w) {
  cat("warn:", conditionMessage(w), "\n"); -1
}, finally = cat("done\n"))
print(res)
