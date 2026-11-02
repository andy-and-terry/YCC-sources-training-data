setClass("Person", representation(name = "character", age = "numeric"))
setGeneric("greet", function(obj) standardGeneric("greet"))
setMethod("greet", "Person", function(obj) cat("Hi,", obj@name, "\n"))
greet(new("Person", name = "Ann", age = 30))
