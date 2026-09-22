setClass("Shape", representation(name = "character"))

setClass("Circle",
  contains = "Shape",
  representation(radius = "numeric")
)

setValidity("Circle", function(object) {
  if (object@radius <= 0) "radius must be positive" else TRUE
})

setGeneric("area", function(shape) standardGeneric("area"))
setMethod("area", "Circle", function(shape) pi * shape@radius^2)

setGeneric("combine", function(a, b) standardGeneric("combine"))
setMethod("combine", signature("Circle", "Circle"), function(a, b) {
  new("Circle", name = paste(a@name, b@name, sep = "+"), radius = a@radius + b@radius)
})

c1 <- new("Circle", name = "small", radius = 2)
print(area(c1))

c2 <- combine(c1, new("Circle", name = "big", radius = 5))
print(c2@name)
print(area(c2))

result <- tryCatch(
  new("Circle", name = "bad", radius = -1),
  error = function(e) conditionMessage(e)
)
print(result)

print(is(c1, "Shape"))
