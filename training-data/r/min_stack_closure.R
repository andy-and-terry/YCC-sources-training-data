make_min_stack <- function() {
  vals <- numeric(0)
  mins <- numeric(0)
  list(
    push = function(x) {
      vals <<- c(vals, x)
      mins <<- c(mins, if (length(mins)) min(x, mins[length(mins)]) else x)
    },
    pop = function() {
      v <- vals[length(vals)]
      vals <<- vals[-length(vals)]
      mins <<- mins[-length(mins)]
      v
    },
    min = function() mins[length(mins)]
  )
}

s <- make_min_stack()
for (v in c(5, 3, 7, 2)) s$push(v)
print(s$min())
s$pop()
print(s$min())
