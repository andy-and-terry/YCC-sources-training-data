# A singleton via a closure-backed factory: repeated calls to
# get_instance() always return the same underlying environment.
make_singleton_factory <- function() {
  instance <- NULL

  function() {
    if (is.null(instance)) {
      instance <<- new.env()
      instance$created_at <- Sys.time()
      instance$count <- 0
    }
    instance
  }
}

get_instance <- make_singleton_factory()

a <- get_instance()
b <- get_instance()
a$count <- a$count + 1
b$count <- b$count + 1

print(identical(a, b))
print(a$count)
