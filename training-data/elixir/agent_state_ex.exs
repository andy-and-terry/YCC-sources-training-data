{:ok, pid} = Agent.start_link(fn -> %{} end)
Agent.update(pid, &Map.put(&1, :a, 1))
Agent.update(pid, &Map.update(&1, :a, 0, fn v -> v + 10 end))
IO.inspect(Agent.get(pid, & &1))
