lucas_lehmer <- function(p) {
  if (p == 2) return(TRUE)
  m <- 2^p - 1
  s <- 4
  for (i in 1:(p - 2)) {
    s <- (s * s - 2) %% m
  }
  s == 0
}

exps <- Filter(lucas_lehmer, c(2, 3, 5, 7, 11, 13, 17, 19))
cat(paste(as.integer(exps), collapse = " "), "\n", sep = "")
