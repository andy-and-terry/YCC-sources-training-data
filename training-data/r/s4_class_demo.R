setClass("Rectangle", representation(width = "numeric", height = "numeric"))

setGeneric("area", function(shape) standardGeneric("area"))
setMethod("area", "Rectangle", function(shape) shape@width * shape@height)

r <- new("Rectangle", width = 4, height = 5)
print(area(r))
