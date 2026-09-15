setClass("Circle", representation(radius = "numeric"))
setClass("Square", representation(side = "numeric"))

setGeneric("shape_area", function(shape) standardGeneric("shape_area"))
setMethod("shape_area", "Circle", function(shape) pi * shape@radius^2)
setMethod("shape_area", "Square", function(shape) shape@side^2)

shape_factory <- function(kind, param) {
  switch(kind,
    circle = new("Circle", radius = param),
    square = new("Square", side = param),
    stop("unknown shape: ", kind)
  )
}

circle <- shape_factory("circle", 2)
square <- shape_factory("square", 3)

print(shape_area(circle))
print(shape_area(square))
