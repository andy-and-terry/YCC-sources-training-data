wrap_greedy <- function(text, width) {
  lines <- character(0)
  line <- ""
  for (word in strsplit(text, "\\s+")[[1]]) {
    if (nchar(line) > 0 && nchar(line) + 1 + nchar(word) > width) {
      lines <- c(lines, line)
      line <- word
    } else {
      line <- if (nchar(line) == 0) word else paste(line, word)
    }
  }
  if (nchar(line) > 0) lines <- c(lines, line)
  lines
}

for (l in wrap_greedy("the quick brown fox jumps over the lazy dog", 15)) cat(sprintf("|%-15s|\n", l))
