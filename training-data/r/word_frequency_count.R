word_frequency <- function(text) {
  words <- strsplit(tolower(text), " ")[[1]]
  table(words)
}

print(word_frequency("the quick brown fox the lazy fox"))
