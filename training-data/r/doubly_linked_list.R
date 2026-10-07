new_dll <- function() {
  new.env()
}

dll_init <- function(dll) {
  dll$head <- NULL
  dll$tail <- NULL
  dll
}

dll_append <- function(dll, value) {
  node <- new.env()
  node$value <- value
  node$prev <- NULL
  node$next_ <- NULL

  if (is.null(dll$head)) {
    dll$head <- node
    dll$tail <- node
  } else {
    node$prev <- dll$tail
    dll$tail$next_ <- node
    dll$tail <- node
  }
}

dll_to_vector <- function(dll) {
  values <- c()
  node <- dll$head
  while (!is.null(node)) {
    values <- c(values, node$value)
    node <- node$next_
  }
  values
}

dll_to_vector_reverse <- function(dll) {
  values <- c()
  node <- dll$tail
  while (!is.null(node)) {
    values <- c(values, node$value)
    node <- node$prev
  }
  values
}

list_env <- dll_init(new_dll())
for (v in c(1, 2, 3, 4)) dll_append(list_env, v)

print(dll_to_vector(list_env))
print(dll_to_vector_reverse(list_env))
