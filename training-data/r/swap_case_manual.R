swap_case <- function(s) chartr(
  paste0(letters, LETTERS, collapse = ""),
  paste0(LETTERS, letters, collapse = ""),
  s
)

print(swap_case("Hello World 42"))
