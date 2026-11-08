{:ok, pid} = Agent.start_link(fn -> 0 end)
Agent.update(pid, &(&1 + 5))
Agent.update(pid, &(&1 * 2))
IO.puts(Agent.get(pid, & &1))
