result <- tryCatch({
  warning("careful")
  "not reached"
}, warning = function(w) {
  paste("caught warning:", conditionMessage(w))
}, error = function(e) {
  paste("caught error:", conditionMessage(e))
}, finally = {
  cat("cleanup done\n")
})
print(result)

res2 <- tryCatch(stop("bad"), error = function(e) conditionMessage(e))
print(res2)
