defmodule Stack do
  use GenServer

  def start_link(init), do: GenServer.start_link(__MODULE__, init)
  def push(pid, x), do: GenServer.cast(pid, {:push, x})
  def pop(pid), do: GenServer.call(pid, :pop)

  @impl true
  def init(list), do: {:ok, list}
  @impl true
  def handle_cast({:push, x}, s), do: {:noreply, [x | s]}
  @impl true
  def handle_call(:pop, _from, [h | t]), do: {:reply, h, t}
  def handle_call(:pop, _from, []), do: {:reply, nil, []}
end

{:ok, pid} = Stack.start_link([])
Stack.push(pid, 1)
Stack.push(pid, 2)
IO.inspect(Stack.pop(pid))
