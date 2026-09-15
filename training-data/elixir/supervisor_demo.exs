defmodule FlakyWorker do
  use GenServer

  def start_link(_opts), do: GenServer.start_link(__MODULE__, 0, name: __MODULE__)

  def bump, do: GenServer.call(__MODULE__, :bump)
  def crash, do: GenServer.cast(__MODULE__, :crash)

  @impl true
  def init(count), do: {:ok, count}

  @impl true
  def handle_call(:bump, _from, count), do: {:reply, count + 1, count + 1}

  @impl true
  def handle_cast(:crash, _count), do: raise("boom")
end

defmodule DemoSupervisor do
  use Supervisor

  def start_link(_opts), do: Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)

  @impl true
  def init(:ok) do
    children = [
      %{id: FlakyWorker, start: {FlakyWorker, :start_link, [[]]}, restart: :permanent}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end

{:ok, _sup} = DemoSupervisor.start_link([])

IO.inspect(FlakyWorker.bump())
IO.inspect(FlakyWorker.bump())

pid_before = Process.whereis(FlakyWorker)
FlakyWorker.crash()
Process.sleep(50)
pid_after = Process.whereis(FlakyWorker)

IO.inspect(pid_before != pid_after)
IO.inspect(FlakyWorker.bump())
