EuropeanSocket <- setRefClass("EuropeanSocket",
  methods = list(
    voltage = function() 230
  )
)

USPlugAdapter <- setRefClass("USPlugAdapter",
  fields = list(socket = "ANY"),
  methods = list(
    voltage = function() {
      # step-down transformer: 230V -> 120V
      socket$voltage() / 230 * 120
    }
  )
)

power_device <- function(plug) {
  cat("device receives", plug$voltage(), "V\n")
}

socket <- EuropeanSocket$new()
adapter <- USPlugAdapter$new(socket = socket)
power_device(adapter)
