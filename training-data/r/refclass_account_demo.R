Account <- setRefClass("Account",
  fields = list(owner = "character", balance = "numeric"),
  methods = list(
    deposit = function(x) {
      balance <<- balance + x
      invisible(.self)
    },
    withdraw = function(x) {
      if (x > balance) stop("insufficient funds")
      balance <<- balance - x
      invisible(.self)
    },
    show = function() {
      cat("Account<", owner, ":", balance, ">\n")
    }
  )
)

a <- Account$new(owner = "Ann", balance = 100)
a$deposit(50)$withdraw(30)
print(a$balance)
a

b <- a
b$deposit(10)
print(a$balance)

c2 <- a$copy()
c2$deposit(1000)
print(a$balance)

res <- tryCatch(a$withdraw(1e6), error = function(e) conditionMessage(e))
print(res)
