person <- list(name = "Ada", age = 36, langs = c("R", "C"), address = list(city = "London", zip = "N1"))
print(person$name)
print(person[["address"]]$city)
person$age <- 37
person$email <- NULL
person[["phone"]] <- "555"
print(names(person))
str(person)
print(length(person))
print(unlist(person$address))
print(rapply(list(1, list(2, 3)), function(x) x * 10, how = "unlist"))
people <- list(list(n = "a", a = 30), list(n = "b", a = 20))
print(sapply(people, `[[`, "n"))
print(sapply(people, function(p) p$a))
sorted <- people[order(sapply(people, function(p) p$a))]
print(sorted[[1]]$n)
print(modifyList(list(a = 1, b = 2), list(b = 3, c = 4)))
print(Reduce(`+`, list(1, 2, 3), accumulate = TRUE))
