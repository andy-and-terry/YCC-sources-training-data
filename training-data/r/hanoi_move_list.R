hanoi <- function(n, from = "A", via = "B", to = "C") {
  if (n == 0) return(character())
  c(hanoi(n - 1, from, to, via), paste0(from, "->", to), hanoi(n - 1, via, from, to))
}
m <- hanoi(3)
cat(length(m), ":", m, "\n")
