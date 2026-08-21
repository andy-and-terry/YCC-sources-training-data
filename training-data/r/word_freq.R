word_freq <- function(text) {
  words <- unlist(strsplit(tolower(text), "\\s+"))
  sort(table(words), decreasing = TRUE)
}

sample_text <- "the quick brown fox jumps over the lazy dog the fox runs"
print(head(word_freq(sample_text), 3))
