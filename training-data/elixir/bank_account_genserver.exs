defmodule BankAccount do
  use GenServer

  def start_link(initial \\ 0), do: GenServer.start_link(__MODULE__, initial)
  def deposit(pid, amount) when amount > 0, do: GenServer.call(pid, {:deposit, amount})
  def withdraw(pid, amount), do: GenServer.call(pid, {:withdraw, amount})
  def balance(pid), do: GenServer.call(pid, :balance)

  @impl true
  def init(balance), do: {:ok, balance}

  @impl true
  def handle_call({:deposit, n}, _from, bal), do: {:reply, :ok, bal + n}
  def handle_call({:withdraw, n}, _from, bal) when n > bal, do: {:reply, {:error, :insufficient_funds}, bal}
  def handle_call({:withdraw, n}, _from, bal), do: {:reply, :ok, bal - n}
  def handle_call(:balance, _from, bal), do: {:reply, bal, bal}
end

{:ok, pid} = BankAccount.start_link()

1..8
|> Enum.map(fn _ -> Task.async(fn -> Enum.each(1..1000, fn _ -> BankAccount.deposit(pid, 1) end) end) end)
|> Enum.each(&Task.await/1)

IO.inspect(BankAccount.balance(pid))
IO.inspect(BankAccount.withdraw(pid, 1_000_000))
