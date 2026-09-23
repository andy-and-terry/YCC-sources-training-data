Memento <- setRefClass("Memento",
  fields = list(state = "character")
)

TextEditor <- setRefClass("TextEditor",
  fields = list(content = "character"),
  methods = list(
    initialize = function() {
      content <<- ""
    },
    type = function(text) {
      content <<- paste0(content, text)
    },
    save = function() {
      Memento$new(state = content)
    },
    restore = function(memento) {
      content <<- memento$state
    }
  )
)

editor <- TextEditor$new()
editor$type("Hello")
checkpoint <- editor$save()
editor$type(", world!")
cat("before undo:", editor$content, "\n")

editor$restore(checkpoint)
cat("after undo:", editor$content, "\n")
