# match.arg: validate an argument against a fixed set of choices
summarise <- function(x, method = c("mean", "median", "max")) {
  method <- match.arg(method)
  switch(method,
    mean = mean(x),
    median = median(x),
    max = max(x)
  )
}

values <- c(3, 9, 4, 10, 1)
print(summarise(values))              # default: first choice
print(summarise(values, "median"))
print(summarise(values, "ma"))        # partial matching -> "max"

res <- tryCatch(summarise(values, "mode"), error = function(e) conditionMessage(e))
print(res)

# Several choices at once
pick <- function(opts = c("a", "b", "c")) match.arg(opts, several.ok = TRUE)
print(pick())
print(pick(c("a", "c")))
