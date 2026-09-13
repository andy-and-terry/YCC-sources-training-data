defmodule NamedCounter do
  use Agent

  def start_link(name) do
    Agent.start_link(fn -> 0 end, name: {:via, Registry, {CounterRegistry, name}})
  end

  def increment(name) do
    Agent.update({:via, Registry, {CounterRegistry, name}}, &(&1 + 1))
  end

  def value(name) do
    Agent.get({:via, Registry, {CounterRegistry, name}}, & &1)
  end
end

{:ok, _} = Registry.start_link(keys: :unique, name: CounterRegistry)
{:ok, _} = NamedCounter.start_link(:visits)

NamedCounter.increment(:visits)
NamedCounter.increment(:visits)
IO.inspect(NamedCounter.value(:visits))
IO.inspect(Registry.lookup(CounterRegistry, :visits) != [])
