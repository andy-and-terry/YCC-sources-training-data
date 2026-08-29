insert_node <- function(node, value) {
  if (is.null(node)) {
    return(list(value = value, left = NULL, right = NULL))
  }
  if (value < node$value) {
    node$left <- insert_node(node$left, value)
  } else if (value > node$value) {
    node$right <- insert_node(node$right, value)
  }
  node
}

inorder <- function(node, result) {
  if (is.null(node)) return(result)
  result <- inorder(node$left, result)
  result <- c(result, node$value)
  result <- inorder(node$right, result)
  result
}

root <- NULL
for (v in c(5, 3, 8, 1, 4, 7, 9)) {
  root <- insert_node(root, v)
}
print(inorder(root, c()))
