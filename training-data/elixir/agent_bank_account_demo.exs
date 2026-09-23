defmodule BankAccount do
  use Agent

  def start_link(balance), do: Agent.start_link(fn -> balance end)

  def balance(pid), do: Agent.get(pid, & &1)

  def deposit(pid, amount), do: Agent.update(pid, &(&1 + amount))

  def withdraw(pid, amount) do
    Agent.get_and_update(pid, fn balance ->
      if amount > balance do
        {{:error, :insufficient_funds}, balance}
      else
        {{:ok, balance - amount}, balance - amount}
      end
    end)
  end
end

{:ok, pid} = BankAccount.start_link(100)
BankAccount.deposit(pid, 50)

IO.inspect(BankAccount.balance(pid))
IO.inspect(BankAccount.withdraw(pid, 30))
IO.inspect(BankAccount.balance(pid))
IO.inspect(BankAccount.withdraw(pid, 1000))
IO.inspect(BankAccount.balance(pid))
