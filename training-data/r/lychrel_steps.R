# Reverse-and-add until a palindrome; count the steps.
rev_digits <- function(n) {
  as.numeric(paste(rev(strsplit(format(n, scientific = FALSE), "")[[1]]), collapse = ""))
}

steps <- function(n) {
  for (count in 0:49) {
    if (count > 0 && n == rev_digits(n)) return(count)
    n <- n + rev_digits(n)
  }
  -1
}

cat(sapply(c(56, 57, 59, 79, 89), steps), "\n")
