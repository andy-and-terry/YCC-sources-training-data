Point <- function(x, y) {
  structure(list(x = x, y = y), class = "Point")
}

"+.Point" <- function(a, b) {
  Point(a$x + b$x, a$y + b$y)
}

print.Point <- function(p, ...) {
  cat(sprintf("(%s, %s)\n", p$x, p$y))
}

p1 <- Point(1, 2)
p2 <- Point(3, 4)
print(p1 + p2)
