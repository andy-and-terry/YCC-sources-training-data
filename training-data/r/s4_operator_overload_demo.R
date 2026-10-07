setClass("Vec2", representation(x = "numeric", y = "numeric"))

setMethod("+", signature("Vec2", "Vec2"), function(e1, e2) {
  new("Vec2", x = e1@x + e2@x, y = e1@y + e2@y)
})

setMethod("*", signature("Vec2", "numeric"), function(e1, e2) {
  new("Vec2", x = e1@x * e2, y = e1@y * e2)
})

setMethod("show", "Vec2", function(object) {
  cat(sprintf("Vec2(%s, %s)\n", object@x, object@y))
})

v1 <- new("Vec2", x = 1, y = 2)
v2 <- new("Vec2", x = 3, y = 4)

print(v1 + v2)
print(v1 * 3)
