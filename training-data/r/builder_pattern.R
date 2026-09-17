PizzaBuilder <- setRefClass("PizzaBuilder",
  fields = list(size = "character", toppings = "character"),
  methods = list(
    initialize = function() {
      size <<- "medium"
      toppings <<- character(0)
    },
    set_size = function(s) {
      size <<- s
      invisible(.self)
    },
    add_topping = function(t) {
      toppings <<- c(toppings, t)
      invisible(.self)
    },
    build = function() {
      list(size = size, toppings = toppings)
    }
  )
)

pizza <- PizzaBuilder$new()$set_size("large")$add_topping("cheese")$add_topping("olives")$build()

cat("size:", pizza$size, "\n")
cat("toppings:", paste(pizza$toppings, collapse = ", "), "\n")
