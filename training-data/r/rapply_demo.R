# rapply: apply a function recursively over a nested list
config <- list(
  name = "service",
  ports = list(http = 80, https = 443),
  limits = list(cpu = 2.5, tags = list("a", "b")),
  retries = 3L
)

# Only numeric leaves, unlisted into a flat vector
print(rapply(config, function(x) x * 2, classes = "numeric", how = "unlist"))

# Keep the structure, transform just the character leaves
upper <- rapply(config, toupper, classes = "character", how = "replace")
str(upper)

# how = "list": non-matching leaves become `deflt`
res <- rapply(config, nchar, classes = "character", deflt = NA, how = "list")
str(res)

# Count leaves
print(length(rapply(config, function(x) 1, how = "unlist")))
