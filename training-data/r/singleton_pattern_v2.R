make_singleton <- local({
  instance <- NULL

  function() {
    if (is.null(instance)) {
      cat("creating new instance\n")
      instance <<- list(id = 1, created = TRUE)
    }
    instance
  }
})

s1 <- make_singleton()
s2 <- make_singleton()
print(identical(s1, s2))
print(s1$id)
