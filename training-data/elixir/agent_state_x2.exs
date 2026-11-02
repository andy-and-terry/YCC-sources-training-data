{:ok, a} = Agent.start_link(fn -> %{} end)
Agent.update(a, &Map.put(&1, :k, 1))
IO.inspect(Agent.get(a, & &1))
