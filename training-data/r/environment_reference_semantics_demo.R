Counter <- setRefClass("Counter",
  fields = list(value = "numeric"),
  methods = list(
    initialize = function() {
      value <<- 0
    },
    increment = function() {
      value <<- value + 1
    }
  )
)

c1 <- Counter$new()
c2 <- c1
c1$increment()
c1$increment()
print(c2$value)
