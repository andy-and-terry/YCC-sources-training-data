# Emirps below 200; expect 15.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) { if (n %% d == 0) return(FALSE); d <- d + 1 }
  TRUE
}

rev_num <- function(n) as.integer(paste(rev(strsplit(as.character(n), "")[[1]]), collapse = ""))
found <- Filter(function(n) rev_num(n) != n && is_prime(n) && is_prime(rev_num(n)), 2:199)
cat(length(found), ":", found, "\n")
