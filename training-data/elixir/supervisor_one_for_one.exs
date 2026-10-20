defmodule Worker do
  use GenServer
  def start_link(arg), do: GenServer.start_link(__MODULE__, arg, name: arg)
  def init(arg), do: {:ok, arg}
  def handle_call(:id, _, s), do: {:reply, s, s}
end

children = [
  %{id: :a, start: {Worker, :start_link, [:a]}},
  %{id: :b, start: {Worker, :start_link, [:b]}}
]

{:ok, sup} = Supervisor.start_link(children, strategy: :one_for_one)
IO.inspect(Supervisor.count_children(sup).active)
IO.inspect(GenServer.call(:a, :id))
