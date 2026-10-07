new_node <- function(value, nxt = NULL) {
  list(value = value, nxt = nxt)
}

ll_prepend <- function(head, value) {
  new_node(value, head)
}

ll_append <- function(head, value) {
  if (is.null(head)) return(new_node(value))
  head$nxt <- ll_append(head$nxt, value)
  head
}

ll_to_vector <- function(head) {
  values <- c()
  node <- head
  while (!is.null(node)) {
    values <- c(values, node$value)
    node <- node$nxt
  }
  values
}

list1 <- NULL
list1 <- ll_append(list1, 1)
list1 <- ll_append(list1, 2)
list1 <- ll_append(list1, 3)
list1 <- ll_prepend(list1, 0)
print(ll_to_vector(list1))
