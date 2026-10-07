# Working with nested lists: access, modification and rapply.
config <- list(
  server = list(host = "localhost", port = 8080),
  debug = TRUE,
  tags = c("a", "b")
)

print(config$server$port)
print(config[["server"]][["host"]])

config$server$port <- 9090
config$logging <- list(level = "info")
str(config)

config$debug <- NULL
print(names(config))

doubled <- rapply(list(1, list(2, 3), 4), function(x) x * 2, how = "list")
str(doubled)

print(unlist(list(a = 1, b = list(c = 2, d = 3))))
print(modifyList(list(a = 1, b = 2), list(b = 20, c = 30)))
