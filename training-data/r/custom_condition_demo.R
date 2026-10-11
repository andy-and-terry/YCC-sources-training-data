my_condition <- function(msg, class) {
  structure(class = c(class, "condition"),
            list(message = msg, call = sys.call(-1)))
}

validate <- function(x) {
  if (x < 0) stop(my_condition("negative input", "negative_error"))
  if (x == 0) warning(my_condition("zero input", "zero_warning"))
  sqrt(x)
}

for (v in c(4, 0, -1)) {
  r <- withCallingHandlers(
    tryCatch(validate(v),
             negative_error = function(e) paste("handled:", conditionMessage(e))),
    zero_warning = function(w) {
      cat("warning seen:", conditionMessage(w), "\n")
      invokeRestart("muffleWarning")
    })
  print(r)
}

cond <- simpleCondition("note")
class(cond) <- c("info", "condition")
withCallingHandlers(signalCondition(cond), info = function(c) cat("got info\n"))
print(tryCatch(signalCondition(cond), condition = function(c) class(c)[1]))
