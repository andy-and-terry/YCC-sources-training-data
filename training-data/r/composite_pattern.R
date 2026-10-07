FileLeaf <- setRefClass("FileLeaf",
  fields = list(name = "character", size = "numeric"),
  methods = list(
    total_size = function() size,
    describe = function(indent = "") cat(indent, name, "(", size, "KB)\n")
  )
)

Directory <- setRefClass("Directory",
  fields = list(name = "character", children = "list"),
  methods = list(
    initialize = function(...) {
      children <<- list()
      callSuper(...)
    },
    add = function(child) {
      children[[length(children) + 1]] <<- child
      invisible(.self)
    },
    total_size = function() {
      sum(sapply(children, function(c) c$total_size()))
    },
    describe = function(indent = "") {
      cat(indent, name, "/\n")
      for (child in children) child$describe(paste0(indent, "  "))
    }
  )
)

root <- Directory$new(name = "root")
root$add(FileLeaf$new(name = "a.txt", size = 10))

sub <- Directory$new(name = "sub")
sub$add(FileLeaf$new(name = "b.txt", size = 20))
sub$add(FileLeaf$new(name = "c.txt", size = 5))
root$add(sub)

root$describe()
cat("total size:", root$total_size(), "KB\n")
