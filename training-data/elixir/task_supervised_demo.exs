defmodule TaskSupervisedDemo do
  def run do
    {:ok, supervisor} = Task.Supervisor.start_link()

    tasks = Enum.map(1..3, fn n -> Task.Supervisor.async(supervisor, fn -> n * n end) end)
    results = Task.await_many(tasks)

    IO.inspect(results)
    IO.inspect(Task.Supervisor.children(supervisor) |> length())
  end
end

TaskSupervisedDemo.run()
