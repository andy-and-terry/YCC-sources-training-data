defmodule InsufficientFundsError do
  defexception message: "insufficient funds"
end

defmodule Account do
  defstruct balance: 0

  def withdraw(%Account{balance: balance}, amount) when amount > balance do
    raise InsufficientFundsError, message: "cannot withdraw #{amount}, balance is #{balance}"
  end

  def withdraw(%Account{balance: balance} = account, amount) do
    %{account | balance: balance - amount}
  end
end

account = %Account{balance: 100}

try do
  Account.withdraw(account, 200)
rescue
  e in InsufficientFundsError -> IO.puts("Caught: #{e.message}")
end

updated = Account.withdraw(account, 50)
IO.inspect(updated)
