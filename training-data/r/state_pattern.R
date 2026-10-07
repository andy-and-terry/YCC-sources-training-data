# State: behavior is dispatched through a mutable "state" field on a
# reference object rather than a chain of if/else on a status flag.

TrafficLight <- setRefClass("TrafficLight",
  fields = list(state = "character"),
  methods = list(
    initialize = function(...) {
      state <<- "red"
      callSuper(...)
    },
    next_state = function() {
      state <<- switch(state,
        red = "green",
        green = "yellow",
        yellow = "red"
      )
    },
    describe = function() {
      cat("light is", state, "\n")
    }
  )
)

light <- TrafficLight$new()
for (i in 1:4) {
  light$describe()
  light$next_state()
}
