with_resource <- function(name) {
  cat("open", name, "\n")
  on.exit(cat("close", name, "\n"))
  cat("working with", name, "\n")
  invisible(name)
}
with_resource("db")

failing <- function() {
  on.exit(cat("cleanup runs even on error\n"))
  stop("something went wrong")
}
result <- tryCatch(failing(), error = function(e) conditionMessage(e))
print(result)

multiple <- function() {
  on.exit(cat("first registered\n"))
  on.exit(cat("second registered (added)\n"), add = TRUE)
  on.exit(cat("third registered (runs first)\n"), add = TRUE, after = FALSE)
  cat("body\n")
}
multiple()

temp_option <- function() {
  old <- options(digits = 3)
  on.exit(options(old))
  print(pi)
}
temp_option()
print(pi)

tmp <- tempfile()
write_and_read <- function(path) {
  con <- file(path, "w")
  on.exit(close(con))
  writeLines(c("line one", "line two"), con)
}
write_and_read(tmp)
print(readLines(tmp))
unlink(tmp)
