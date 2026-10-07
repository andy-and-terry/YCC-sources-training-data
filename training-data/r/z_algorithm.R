z_array <- function(s) {
  n <- nchar(s)
  chars <- strsplit(s, "")[[1]]
  z <- integer(n)
  left <- 0
  right <- 0

  for (i in 2:n) {
    if (i <= right) {
      z[i] <- min(right - i + 1, z[i - left + 1])
    }
    while (i + z[i] <= n && chars[z[i] + 1] == chars[i + z[i]]) {
      z[i] <- z[i] + 1
    }
    if (i + z[i] - 1 > right) {
      left <- i
      right <- i + z[i] - 1
    }
  }
  z
}

z_search <- function(text, pattern) {
  combined <- paste0(pattern, "$", text)
  z <- z_array(combined)
  m <- nchar(pattern)
  matches <- c()
  for (i in seq_along(z)) {
    if (z[i] == m) {
      matches <- c(matches, i - m - 2)
    }
  }
  matches
}

print(z_search("abxabcabcaby", "abcaby"))
