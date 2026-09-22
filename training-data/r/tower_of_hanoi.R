tower_of_hanoi <- function(n, from, to, via) {
  if (n == 0) return(invisible(NULL))
  tower_of_hanoi(n - 1, from, via, to)
  cat("move disk", n, "from", from, "to", to, "\n")
  tower_of_hanoi(n - 1, via, to, from)
}

tower_of_hanoi(3, "A", "C", "B")
