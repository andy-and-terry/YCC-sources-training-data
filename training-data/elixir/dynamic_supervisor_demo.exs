defmodule Job do
  use Agent

  def start_link(id), do: Agent.start_link(fn -> id end)
  def id(pid), do: Agent.get(pid, & &1)
end

{:ok, sup} = DynamicSupervisor.start_link(strategy: :one_for_one)

{:ok, job1} = DynamicSupervisor.start_child(sup, {Job, 1})
{:ok, job2} = DynamicSupervisor.start_child(sup, {Job, 2})

IO.inspect(Job.id(job1))
IO.inspect(Job.id(job2))
IO.inspect(DynamicSupervisor.count_children(sup))
