kind <- function(x) {
  switch(x,
         "a" = ,
         "e" = ,
         "i" = "vowel",
         "z" = "last letter",
         "other")
}
print(sapply(c("a", "e", "z", "q"), kind))
print(switch(2, "one", "two", "three"))
print(is.null(switch(4, "one", "two", "three")))
print(is.null(switch("nope", a = 1)))
op <- function(sym, a, b) switch(sym, "+" = a + b, "-" = a - b, "*" = a * b, stop("unknown op"))
print(op("*", 3, 4))
print(tryCatch(op("^", 1, 2), error = function(e) conditionMessage(e)))
