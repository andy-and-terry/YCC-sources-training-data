res <- tryCatch({
  warning("careful")
}, warning = function(w) {
  paste("warn:", conditionMessage(w))
}, finally = cat("finally\n"))
print(res)
cond <- structure(class = c("myError", "error", "condition"), list(message = "custom", call = NULL))
print(tryCatch(stop(cond), myError = function(e) "got myError"))
