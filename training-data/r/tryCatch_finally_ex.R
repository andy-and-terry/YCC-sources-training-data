res <- tryCatch({
  warning("careful")
  1
}, warning = function(w) {
  message("caught: ", conditionMessage(w))
  -1
}, finally = cat("done\n"))
print(res)
print(tryCatch(stop("bad"), error = function(e) conditionMessage(e)))
