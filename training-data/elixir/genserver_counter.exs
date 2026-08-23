defmodule Counter do
  use GenServer

  def start_link(initial), do: GenServer.start_link(__MODULE__, initial)

  def increment(pid), do: GenServer.cast(pid, :increment)
  def value(pid), do: GenServer.call(pid, :value)

  @impl true
  def init(initial), do: {:ok, initial}

  @impl true
  def handle_cast(:increment, state), do: {:noreply, state + 1}

  @impl true
  def handle_call(:value, _from, state), do: {:reply, state, state}
end

{:ok, pid} = Counter.start_link(0)
Counter.increment(pid)
Counter.increment(pid)
IO.inspect(Counter.value(pid))
