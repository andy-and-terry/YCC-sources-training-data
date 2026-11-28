defmodule Counter do
  use GenServer

  def start_link(n), do: GenServer.start_link(__MODULE__, n)
  def inc(pid), do: GenServer.call(pid, :inc)

  @impl true
  def init(n), do: {:ok, n}
  @impl true
  def handle_call(:inc, _from, n), do: {:reply, n + 1, n + 1}
end

{:ok, pid} = Counter.start_link(0)
Counter.inc(pid)
IO.puts(Counter.inc(pid))
