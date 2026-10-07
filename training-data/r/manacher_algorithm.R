longest_palindrome_manacher <- function(s) {
  transformed <- paste0("^#", paste(strsplit(s, "")[[1]], collapse = "#"), "#$")
  chars <- strsplit(transformed, "")[[1]]
  n <- length(chars)
  p <- integer(n)
  center <- 0
  right <- 0

  for (i in 2:(n - 1)) {
    mirror <- 2 * center - i
    if (i < right) {
      p[i] <- min(right - i, p[mirror])
    }
    while (chars[i + p[i] + 1] == chars[i - p[i] - 1]) {
      p[i] <- p[i] + 1
    }
    if (i + p[i] > right) {
      center <- i
      right <- i + p[i]
    }
  }

  max_len <- max(p)
  center_index <- which.max(p)
  start <- (center_index - max_len - 1) / 2
  substr(s, start + 1, start + max_len)
}

print(longest_palindrome_manacher("babad"))
print(longest_palindrome_manacher("cbbd"))
