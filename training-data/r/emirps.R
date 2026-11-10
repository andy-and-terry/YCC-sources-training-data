is_prime <- function(n) {
  if (n < 2) return(FALSE)
  if (n < 4) return(TRUE)
  all(n %% 2:floor(sqrt(n)) != 0)
}
rev_num <- function(n) as.numeric(paste(rev(strsplit(as.character(n), "")[[1]]), collapse = ""))

out <- c(); n <- 2
while (length(out) < 10) {
  r <- rev_num(n)
  if (r != n && is_prime(n) && is_prime(r)) out <- c(out, n)
  n <- n + 1
}
cat(out, "\n") # 13 17 31 37 71 73 79 97 107 113
