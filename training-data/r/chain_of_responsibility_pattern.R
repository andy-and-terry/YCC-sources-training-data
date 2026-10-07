Handler <- setRefClass("Handler",
  fields = list(next_handler = "ANY"),
  methods = list(
    initialize = function(...) {
      next_handler <<- NULL
      callSuper(...)
    },
    set_next = function(handler) {
      next_handler <<- handler
      invisible(handler)
    },
    handle = function(amount) {
      if (!is.null(next_handler)) next_handler$handle(amount)
      else cat("no handler could process", amount, "\n")
    }
  )
)

SmallNoteDispenser <- setRefClass("SmallNoteDispenser",
  contains = "Handler",
  methods = list(
    handle = function(amount) {
      if (amount <= 20) cat("dispensing", amount, "using $20 or smaller notes\n")
      else callSuper(amount)
    }
  )
)

LargeNoteDispenser <- setRefClass("LargeNoteDispenser",
  contains = "Handler",
  methods = list(
    handle = function(amount) {
      if (amount <= 100) cat("dispensing", amount, "using $100 notes\n")
      else callSuper(amount)
    }
  )
)

small <- SmallNoteDispenser$new()
large <- LargeNoteDispenser$new()
small$set_next(large)

small$handle(20)
small$handle(80)
small$handle(500)
