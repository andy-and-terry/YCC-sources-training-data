words <- c("apple", "kiwi", "banana", "fig")

lengths_vec <- vapply(words, nchar, FUN.VALUE = integer(1))
print(lengths_vec)

is_short <- vapply(words, function(w) nchar(w) <= 4, FUN.VALUE = logical(1))
print(is_short)

result <- tryCatch(
  vapply(words, function(w) c(nchar(w), 1), FUN.VALUE = integer(1)),
  error = function(e) conditionMessage(e)
)
print(result)
