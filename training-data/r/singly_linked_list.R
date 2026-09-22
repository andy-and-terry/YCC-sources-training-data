LinkedList <- setRefClass("LinkedList",
  fields = list(head = "ANY", size = "numeric"),
  methods = list(
    initialize = function() {
      head <<- NULL
      size <<- 0
    },
    push_front = function(value) {
      head <<- list(value = value, rest = head)
      size <<- size + 1
    },
    to_vector = function() {
      out <- c()
      node <- head
      while (!is.null(node)) {
        out <- c(out, node$value)
        node <- node$rest
      }
      out
    },
    contains = function(value) {
      node <- head
      while (!is.null(node)) {
        if (identical(node$value, value)) return(TRUE)
        node <- node$rest
      }
      FALSE
    }
  )
)

list_obj <- LinkedList$new()
for (v in c(3, 1, 4, 1, 5)) {
  list_obj$push_front(v)
}
print(list_obj$to_vector())
print(list_obj$contains(4))
print(list_obj$size)
