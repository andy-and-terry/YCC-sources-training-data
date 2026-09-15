Subject <- setRefClass("Subject",
  fields = list(observers = "list"),
  methods = list(
    initialize = function() {
      observers <<- list()
    },
    subscribe = function(callback) {
      observers[[length(observers) + 1]] <<- callback
    },
    notify_all = function(value) {
      for (callback in observers) {
        callback(value)
      }
    }
  )
)

TemperatureSensor <- setRefClass("TemperatureSensor",
  contains = "Subject",
  methods = list(
    set_temperature = function(value) {
      notify_all(value)
    }
  )
)

sensor <- TemperatureSensor$new()
sensor$subscribe(function(t) cat("Alert: temperature is now", t, "\n"))
sensor$set_temperature(25.5)
