check <- function(x) {
  stopifnot("x must be numeric" = is.numeric(x),
            "x must be positive" = all(x > 0))
  sqrt(x)
}
print(check(c(4, 9)))
print(tryCatch(check("a"), error = function(e) conditionMessage(e)))
print(tryCatch(check(-1), error = function(e) conditionMessage(e)))

r <- tryCatch(stopifnot(1 == 1, 2 > 3), error = function(e) conditionMessage(e))
print(r)
print(tryCatch(match.arg("me", c("mean", "median")), error = function(e) "ambiguous"))
f <- function(type = c("linear", "quad")) { type <- match.arg(type); type }
print(f()); print(f("quad"))
print(isTRUE(c(TRUE, TRUE))); print(isFALSE(FALSE))
print(tryCatch(stop("a", "b", 3), error = function(e) conditionMessage(e)))
print(inherits(1L, "integer")); print(is(1L, "numeric"))
