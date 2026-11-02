res <- tryCatch({
  as.integer("x")
}, warning = function(w) {
  message("warn: ", conditionMessage(w)); NA
}, finally = cat("done\n"))
print(res)
