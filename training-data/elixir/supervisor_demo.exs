defmodule Worker do
  use Agent

  def start_link(name) do
    Agent.start_link(fn -> 0 end, name: name)
  end

  def bump(name), do: Agent.update(name, &(&1 + 1))
  def value(name), do: Agent.get(name, & &1)
end

defmodule WorkerSupervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      Supervisor.child_spec({Worker, :worker_one}, id: :worker_one),
      Supervisor.child_spec({Worker, :worker_two}, id: :worker_two)
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end

{:ok, _sup} = WorkerSupervisor.start_link([])

Worker.bump(:worker_one)
Worker.bump(:worker_one)
Worker.bump(:worker_two)

IO.inspect(Worker.value(:worker_one))
IO.inspect(Worker.value(:worker_two))
