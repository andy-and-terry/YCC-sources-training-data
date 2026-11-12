r <- tryCatch({
  warning("careful")
}, warning = function(w) paste("W:", conditionMessage(w)),
   error = function(e) "E", finally = cat("done\n"))
print(r)
