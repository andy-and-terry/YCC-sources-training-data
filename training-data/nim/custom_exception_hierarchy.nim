type
  BankError = object of CatchableError
  InsufficientFundsError = object of BankError
  InvalidAmountError = object of BankError

proc withdraw(balance: var float, amount: float) =
  if amount <= 0:
    raise newException(InvalidAmountError, "amount must be positive")
  if amount > balance:
    raise newException(InsufficientFundsError, "not enough funds")
  balance -= amount

var balance = 100.0

try:
  withdraw(balance, -5.0)
except InvalidAmountError as e:
  echo "invalid: " & e.msg
except BankError as e:
  echo "bank error: " & e.msg
finally:
  echo "attempted withdrawal, balance is now " & $balance

try:
  withdraw(balance, 500.0)
except BankError as e:
  echo "bank error: " & e.msg
finally:
  echo "attempted withdrawal, balance is now " & $balance
