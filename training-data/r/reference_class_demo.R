# Reference Classes (R5): mutable, message-passing OOP, distinct from S3's
# generic dispatch and S4's formal-but-immutable-by-default classes.
Account <- setRefClass(
  "Account",
  fields = list(balance = "numeric"),
  methods = list(
    deposit = function(amount) {
      balance <<- balance + amount
    },
    withdraw = function(amount) {
      if (amount > balance) stop("insufficient funds")
      balance <<- balance - amount
    },
    show = function() {
      cat("Account balance:", balance, "\n")
    }
  )
)

acct <- Account$new(balance = 100)
acct$deposit(50)
acct$withdraw(30)
acct$show()

# Reference semantics: copies alias the same underlying object unless copy() is used.
alias <- acct
alias$deposit(1000)
acct$show()

clone <- acct$copy()
clone$deposit(1)
acct$show()
clone$show()
