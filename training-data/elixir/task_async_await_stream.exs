tasks = for n <- 1..4, do: Task.async(fn -> Process.sleep(10); n * n end)
IO.inspect(Task.await_many(tasks))

IO.inspect(
  1..6
  |> Task.async_stream(fn n -> n * 2 end, max_concurrency: 3)
  |> Enum.map(fn {:ok, v} -> v end)
)

{:ok, agent} = Agent.start_link(fn -> %{} end)
Agent.update(agent, &Map.put(&1, :k, 1))
IO.inspect(Agent.get(agent, & &1))
