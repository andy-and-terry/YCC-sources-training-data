run_length_encode <- function(s) {
  chars <- strsplit(s, "")[[1]]
  if (length(chars) == 0) return("")

  result <- c()
  current <- chars[1]
  count <- 1

  if (length(chars) > 1) {
    for (i in 2:length(chars)) {
      if (chars[i] == current) {
        count <- count + 1
      } else {
        result <- c(result, paste0(current, count))
        current <- chars[i]
        count <- 1
      }
    }
  }
  result <- c(result, paste0(current, count))

  paste(result, collapse = "")
}

run_length_decode <- function(s) {
  matches <- gregexpr("[A-Za-z][0-9]+", s)[[1]]
  lengths_vec <- attr(matches, "match.length")
  result <- ""

  for (i in seq_along(matches)) {
    token <- substr(s, matches[i], matches[i] + lengths_vec[i] - 1)
    ch <- substr(token, 1, 1)
    count <- as.integer(substr(token, 2, nchar(token)))
    result <- paste0(result, strrep(ch, count))
  }

  result
}

encoded <- run_length_encode("aaabbbcccc")
print(encoded)
print(run_length_decode(encoded))
