defaults <- list(color = "red", size = 10, opts = list(bold = FALSE))
overrides <- list(size = 12, opts = list(bold = TRUE))

merged <- modifyList(defaults, overrides)
str(merged)

nested <- list(a = 1:3, b = list(c = 4:6, d = 7))
print(rapply(nested, function(x) x * 2, how = "unlist"))
print(nested[["b"]][["c"]][2])
nested$b$d <- NULL
print(names(nested$b))
print(unlist(nested))
