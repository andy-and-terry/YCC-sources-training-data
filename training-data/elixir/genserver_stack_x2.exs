defmodule Stack do
  use GenServer
  def start_link(init), do: GenServer.start_link(__MODULE__, init)
  def push(pid, x), do: GenServer.cast(pid, {:push, x})
  def pop(pid), do: GenServer.call(pid, :pop)
  def init(s), do: {:ok, s}
  def handle_cast({:push, x}, s), do: {:noreply, [x | s]}
  def handle_call(:pop, _from, [h | t]), do: {:reply, h, t}
end

{:ok, pid} = Stack.start_link([])
Stack.push(pid, 1)
Stack.push(pid, 2)
IO.puts(Stack.pop(pid))
