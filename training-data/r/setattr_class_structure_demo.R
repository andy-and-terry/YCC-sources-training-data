x <- 1:6
attr(x, "dim") <- c(2, 3)
print(x)
attributes(x)
y <- structure(1:3, units = "cm", class = "measure")
print(unclass(y))
print.measure <- function(x, ...) {
  cat("<measure>", paste(unclass(x), attr(x, "units")), "\n")
  invisible(x)
}
print(y)
y
format.measure <- function(x, ...) paste0(unclass(x), attr(x, "units"))
cat(format(y), "\n")
"+.measure" <- function(e1, e2) structure(unclass(e1) + unclass(e2), units = attr(e1, "units"), class = "measure")
print(y + y)
length.measure <- function(x) 99L
print(length(y))
print(inherits(y, "measure"))
print(oldClass(y))
levels(y) <- NULL
print(is.null(attr(y, "levels")))
