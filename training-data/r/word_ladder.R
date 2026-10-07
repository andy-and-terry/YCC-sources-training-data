word_ladder_length <- function(begin_word, end_word, word_list) {
  if (!(end_word %in% word_list)) return(0)

  alphabet <- letters
  queue <- list(list(word = begin_word, dist = 1))
  visited <- c(begin_word)

  while (length(queue) > 0) {
    current <- queue[[1]]
    queue <- queue[-1]

    if (current$word == end_word) return(current$dist)

    chars <- strsplit(current$word, "")[[1]]
    for (i in seq_along(chars)) {
      original <- chars[i]
      for (letter in alphabet) {
        if (letter == original) next
        chars[i] <- letter
        candidate <- paste(chars, collapse = "")
        if (candidate %in% word_list && !(candidate %in% visited)) {
          visited <- c(visited, candidate)
          queue[[length(queue) + 1]] <- list(word = candidate, dist = current$dist + 1)
        }
      }
      chars[i] <- original
    }
  }
  0
}

word_list <- c("hot", "dot", "dog", "lot", "log", "cog")
print(word_ladder_length("hit", "cog", c(word_list, "hit")))
