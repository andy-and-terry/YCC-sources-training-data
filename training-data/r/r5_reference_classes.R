Stack <- setRefClass("Stack",
  fields = list(items = "list"),
  methods = list(
    push = function(x) { items[[length(items) + 1]] <<- x; invisible(.self) },
    pop = function() { v <- items[[length(items)]]; items[[length(items)]] <<- NULL; v },
    size = function() length(items),
    peek = function() items[[length(items)]]
  ))
s <- Stack$new()
s$push(1)$push("two")$push(3)
print(s$size()); print(s$pop()); print(s$peek())
t <- s$copy(); t$push(99)
print(c(s$size(), t$size()))
Person <- setRefClass("Person", fields = list(name = "character"), methods = list(
  greet = function() cat("Hi,", name, "\n"),
  initialize = function(...) { initFields(...); if (length(name) == 0) name <<- "anon"; invisible(.self) }))
Student <- setRefClass("Student", contains = "Person", fields = list(school = "character"),
  methods = list(greet = function() { callSuper(); cat("I attend", school, "\n") }))
Student$new(name = "Ada", school = "MIT")$greet()
Person$new()$greet()
