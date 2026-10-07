defmodule PriorityQueue do
  defstruct items: []

  def new, do: %PriorityQueue{}

  def push(%PriorityQueue{items: items}, value) do
    %PriorityQueue{items: insert_sorted(items, value)}
  end

  def pop(%PriorityQueue{items: [head | tail]}), do: {head, %PriorityQueue{items: tail}}
  def pop(%PriorityQueue{items: []}), do: {nil, %PriorityQueue{items: []}}

  def peek(%PriorityQueue{items: [head | _]}), do: head
  def peek(%PriorityQueue{items: []}), do: nil

  def empty?(%PriorityQueue{items: items}), do: items == []

  defp insert_sorted([], value), do: [value]
  defp insert_sorted([head | tail], value) when value <= head, do: [value, head | tail]
  defp insert_sorted([head | tail], value), do: [head | insert_sorted(tail, value)]
end

pq =
  PriorityQueue.new()
  |> PriorityQueue.push(5)
  |> PriorityQueue.push(1)
  |> PriorityQueue.push(8)
  |> PriorityQueue.push(2)

{first, pq} = PriorityQueue.pop(pq)
{second, pq} = PriorityQueue.pop(pq)
IO.inspect({first, second, PriorityQueue.peek(pq)})
