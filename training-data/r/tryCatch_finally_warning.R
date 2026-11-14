res <- tryCatch({
  as.integer("x")
}, warning = function(w) {
  cat("warn:", conditionMessage(w), "\n"); -1L
}, finally = cat("done\n"))
print(res)
