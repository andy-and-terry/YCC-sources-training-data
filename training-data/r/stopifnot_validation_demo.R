safe_sqrt <- function(x) {
  stopifnot(is.numeric(x), length(x) == 1, x >= 0)
  sqrt(x)
}

print(safe_sqrt(16))
res <- tryCatch(safe_sqrt(-4), error = function(e) conditionMessage(e))
print(res)

check_age <- function(age) {
  if (!is.numeric(age)) stop("age must be numeric", call. = FALSE)
  if (age < 0) warning("negative age, using 0")
  max(age, 0)
}

val <- withCallingHandlers(
  check_age(-3),
  warning = function(w) {
    message("caught: ", conditionMessage(w))
    invokeRestart("muffleWarning")
  }
)
print(val)
print(tryCatch(check_age("x"), error = function(e) conditionMessage(e)))
print(inherits(simpleError("boom"), "condition"))
print(try(log(-1), silent = TRUE))
