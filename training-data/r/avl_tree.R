make_node <- function(key) {
  list(key = key, left = NULL, right = NULL, height = 1)
}

node_height <- function(node) {
  if (is.null(node)) 0 else node$height
}

update_height <- function(node) {
  node$height <- 1 + max(node_height(node$left), node_height(node$right))
  node
}

balance_factor <- function(node) {
  if (is.null(node)) 0 else node_height(node$left) - node_height(node$right)
}

rotate_right <- function(y) {
  x <- y$left
  y$left <- x$right
  x$right <- y
  y <- update_height(y)
  x <- update_height(x)
  x
}

rotate_left <- function(x) {
  y <- x$right
  x$right <- y$left
  y$left <- x
  x <- update_height(x)
  y <- update_height(y)
  y
}

avl_insert <- function(node, key) {
  if (is.null(node)) return(make_node(key))

  if (key < node$key) {
    node$left <- avl_insert(node$left, key)
  } else if (key > node$key) {
    node$right <- avl_insert(node$right, key)
  } else {
    return(node)
  }

  node <- update_height(node)
  balance <- balance_factor(node)

  if (balance > 1 && key < node$left$key) {
    return(rotate_right(node))
  }
  if (balance < -1 && key > node$right$key) {
    return(rotate_left(node))
  }
  if (balance > 1 && key > node$left$key) {
    node$left <- rotate_left(node$left)
    return(rotate_right(node))
  }
  if (balance < -1 && key < node$right$key) {
    node$right <- rotate_right(node$right)
    return(rotate_left(node))
  }

  node
}

avl_inorder <- function(node, out = c()) {
  if (is.null(node)) return(out)
  out <- avl_inorder(node$left, out)
  out <- c(out, node$key)
  avl_inorder(node$right, out)
}

root <- NULL
for (value in c(10, 20, 30, 40, 50, 25)) {
  root <- avl_insert(root, value)
}
print(avl_inorder(root))
cat("root:", root$key, "height:", root$height, "\n")
