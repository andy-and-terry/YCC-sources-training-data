# do.call applies a function to a list of arguments, which is handy
# for combining many pieces at once.
frames <- list(
  data.frame(id = 1:2, v = c("a", "b")),
  data.frame(id = 3:4, v = c("c", "d")),
  data.frame(id = 5, v = "e")
)
combined <- do.call(rbind, frames)
print(combined)

args <- list(1:10, na.rm = TRUE)
print(do.call(mean, args))

named <- list(from = 1, to = 10, by = 3)
print(do.call(seq, named))

print(do.call("paste", c(list("a", "b", "c"), sep = "-")))
