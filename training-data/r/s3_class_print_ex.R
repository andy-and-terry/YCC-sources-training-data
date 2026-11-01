dog <- structure(list(name = "Rex"), class = c("dog", "animal"))
speak <- function(x, ...) UseMethod("speak")
speak.animal <- function(x, ...) cat("...\n")
speak.dog <- function(x, ...) { cat(x$name, "barks\n"); NextMethod() }
speak(dog)
print.animal <- function(x, ...) cat("<animal ", x$name, ">\n", sep = "")
print(dog)
