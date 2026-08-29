new_trie_node <- function() {
  list(children = new.env(), is_end = FALSE)
}

trie_insert <- function(node, word) {
  current <- node
  chars <- strsplit(word, "")[[1]]
  for (c in chars) {
    if (is.null(current$children[[c]])) {
      current$children[[c]] <- new_trie_node()
    }
    current <- current$children[[c]]
  }
  current$is_end <- TRUE
}

trie_contains <- function(node, word) {
  current <- node
  chars <- strsplit(word, "")[[1]]
  for (c in chars) {
    if (is.null(current$children[[c]])) return(FALSE)
    current <- current$children[[c]]
  }
  current$is_end
}

trie <- new_trie_node()
trie_insert(trie, "cat")
trie_insert(trie, "car")
print(trie_contains(trie, "cat"))
print(trie_contains(trie, "ca"))
