defaults <- list(host = "localhost", port = 80, opts = list(tls = FALSE, retries = 3))
user <- list(port = 8080, opts = list(tls = TRUE))
cfg <- modifyList(defaults, user)
str(cfg)
cfg <- modifyList(cfg, list(host = NULL))
print(names(cfg))

with_defaults <- function(...) {
  args <- list(...)
  opts <- modifyList(list(sep = ",", quote = FALSE), args)
  opts
}
print(with_defaults(sep = ";")$sep)
print(setNames(1:3, c("a", "b", "c")))
print(stack(list(a = 1:2, b = 3)))
print(rapply(list(1, "a", list(2)), function(x) x * 2, classes = "numeric", how = "replace"))
print(mapply(function(n, v) paste(n, v), names(defaults)[1:2], defaults[1:2]))
print(utils::tail(unlist(defaults), 2))
