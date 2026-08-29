LRUCache <- setRefClass("LRUCache",
  fields = list(capacity = "numeric", map = "list", order = "numeric"),
  methods = list(
    initialize = function(cap) {
      capacity <<- cap
      map <<- list()
      order <<- c()
    },
    get_value = function(key) {
      k <- as.character(key)
      if (!is.null(map[[k]])) {
        order <<- c(order[order != key], key)
        return(map[[k]])
      }
      -1
    },
    put = function(key, value) {
      k <- as.character(key)
      if (!is.null(map[[k]])) {
        order <<- order[order != key]
      }
      map[[k]] <<- value
      order <<- c(order, key)
      if (length(order) > capacity) {
        evict <- order[1]
        order <<- order[-1]
        map[[as.character(evict)]] <<- NULL
      }
    }
  )
)

cache <- LRUCache$new(2)
cache$put(1, 1)
cache$put(2, 2)
print(cache$get_value(1))
cache$put(3, 3)
print(cache$get_value(2))
