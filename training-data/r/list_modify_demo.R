person <- list(name = "Ada", age = 36)
person$email <- "ada@example.com"
person[["age"]] <- 37
person$name <- NULL
str(person)

print(names(person))
print("email" %in% names(person))

defaults <- list(a = 1, b = 2)
overrides <- list(b = 20, c = 30)
merged <- modifyList(defaults, overrides)
str(merged)

nested <- list(x = list(y = list(z = 42)))
print(nested$x$y$z)
print(nested[["x"]][["y"]][["z"]])

lst <- list(1, "a", TRUE)
print(sapply(lst, class))
print(unlist(list(a = 1, b = list(c = 2, d = 3))))
print(rapply(list(1, 2, list(3)), function(x) x * 10, how = "unlist"))
print(setNames(as.list(1:3), c("one", "two", "three")))
