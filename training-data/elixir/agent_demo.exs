defmodule AgentDemo do
  def run do
    {:ok, agent} = Agent.start_link(fn -> [] end)
    Agent.update(agent, fn list -> [1 | list] end)
    Agent.update(agent, fn list -> [2 | list] end)
    IO.inspect(Agent.get(agent, & &1))
    Agent.stop(agent)
  end
end

AgentDemo.run()
