person <- list(name = "Ann", age = 30, langs = c("R", "C"))
print(person$name)
print(person[["age"]])
print(person["langs"])
print(class(person["name"]))
print(class(person[["name"]]))
person$email <- "ann@x.io"
person$age <- NULL
print(names(person))
print(length(person))
str(person)
print(person$lang)       # partial matching with $
print(person[["lang"]])  # exact: NULL
print(unlist(list(a = 1, b = list(c = 2, d = 3))))
