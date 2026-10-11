res <- tryCatch({
  warning("careful")
  "not reached"
}, warning = function(w) paste("caught warning:", conditionMessage(w)),
   error = function(e) "caught error",
   finally = cat("cleanup\n"))
print(res)

safe_log <- function(x) {
  tryCatch(log(x),
           warning = function(w) NA_real_,
           error = function(e) NULL)
}
print(safe_log(10))
print(safe_log(-1))
print(safe_log("a"))

out <- try(stop("oops"), silent = TRUE)
print(class(out))
print(inherits(out, "try-error"))
cat(geterrmessage())

e <- simpleError("custom msg")
print(tryCatch(stop(e), error = function(err) conditionMessage(err)))
f <- function() stop("inside f")
print(tryCatch(f(), error = function(e) deparse(conditionCall(e))))
