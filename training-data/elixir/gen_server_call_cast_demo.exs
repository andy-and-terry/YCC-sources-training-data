defmodule KV do
  use GenServer

  def start_link(init \\ %{}), do: GenServer.start_link(__MODULE__, init)
  def put(pid, k, v), do: GenServer.cast(pid, {:put, k, v})
  def get(pid, k), do: GenServer.call(pid, {:get, k})

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_cast({:put, k, v}, state), do: {:noreply, Map.put(state, k, v)}

  @impl true
  def handle_call({:get, k}, _from, state), do: {:reply, Map.get(state, k), state}
end

{:ok, pid} = KV.start_link()
KV.put(pid, :a, 1)
IO.inspect(KV.get(pid, :a))
IO.inspect(KV.get(pid, :b))
