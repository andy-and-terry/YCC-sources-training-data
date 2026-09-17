new_trie_node <- function() {
  node <- new.env()
  node$children <- new.env()
  node$is_end <- FALSE
  node
}

trie_insert <- function(root, word) {
  node <- root
  for (ch in strsplit(word, "")[[1]]) {
    if (!exists(ch, envir = node$children, inherits = FALSE)) {
      assign(ch, new_trie_node(), envir = node$children)
    }
    node <- get(ch, envir = node$children)
  }
  node$is_end <- TRUE
}

trie_walk <- function(root, prefix) {
  node <- root
  for (ch in strsplit(prefix, "")[[1]]) {
    if (!exists(ch, envir = node$children, inherits = FALSE)) return(NULL)
    node <- get(ch, envir = node$children)
  }
  node
}

trie_search <- function(root, word) {
  node <- trie_walk(root, word)
  !is.null(node) && node$is_end
}

trie_starts_with <- function(root, prefix) {
  !is.null(trie_walk(root, prefix))
}

root <- new_trie_node()
for (w in c("cat", "car", "care", "dog")) {
  trie_insert(root, w)
}

print(trie_search(root, "car"))
print(trie_search(root, "ca"))
print(trie_starts_with(root, "ca"))
print(trie_starts_with(root, "do"))
