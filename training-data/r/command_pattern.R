Command <- setRefClass("Command",
  methods = list(
    execute = function() stop("not implemented"),
    undo = function() stop("not implemented")
  )
)

Light <- setRefClass("Light",
  fields = list(is_on = "logical"),
  methods = list(
    initialize = function() {
      is_on <<- FALSE
    },
    turn_on = function() {
      is_on <<- TRUE
      cat("light on\n")
    },
    turn_off = function() {
      is_on <<- FALSE
      cat("light off\n")
    }
  )
)

LightOnCommand <- setRefClass("LightOnCommand",
  contains = "Command",
  fields = list(light = "ANY"),
  methods = list(
    execute = function() light$turn_on(),
    undo = function() light$turn_off()
  )
)

LightOffCommand <- setRefClass("LightOffCommand",
  contains = "Command",
  fields = list(light = "ANY"),
  methods = list(
    execute = function() light$turn_off(),
    undo = function() light$turn_on()
  )
)

RemoteControl <- setRefClass("RemoteControl",
  fields = list(history = "list"),
  methods = list(
    initialize = function() {
      history <<- list()
    },
    press = function(command) {
      command$execute()
      history[[length(history) + 1]] <<- command
    },
    press_undo = function() {
      if (length(history) > 0) {
        last_command <- history[[length(history)]]
        last_command$undo()
        history[[length(history)]] <<- NULL
      }
    }
  )
)

light <- Light$new()
remote <- RemoteControl$new()

remote$press(LightOnCommand$new(light = light))
remote$press(LightOffCommand$new(light = light))
remote$press_undo()
