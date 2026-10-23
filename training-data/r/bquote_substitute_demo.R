# bquote() builds expressions with .() splicing; substitute() captures arguments.
a <- 5
e <- bquote(x + .(a))
print(e)
print(eval(e, list(x = 10)))

parts <- list(1, 2, 3)
call_expr <- bquote(sum(..(parts)), splice = TRUE)
print(call_expr)
print(eval(call_expr))

show_expr <- function(arg) {
  cat("expression:", deparse(substitute(arg)), "\n")
  invisible(arg)
}
show_expr(a * 2 + 1)

f <- function(x) substitute(x)
print(class(f(y + z)))
print(all.vars(f(y + z * w)))
