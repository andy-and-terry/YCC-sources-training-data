defmodule Stack do
  defstruct items: []

  def new, do: %Stack{}

  def push(%Stack{items: items}, item), do: %Stack{items: [item | items]}

  def pop(%Stack{items: [head | tail]}), do: {head, %Stack{items: tail}}
  def pop(%Stack{items: []}), do: {nil, %Stack{items: []}}

  def peek(%Stack{items: [head | _]}), do: head
  def peek(%Stack{items: []}), do: nil
end

stack = Stack.new() |> Stack.push(1) |> Stack.push(2) |> Stack.push(3)
{top, rest} = Stack.pop(stack)
IO.inspect({top, Stack.peek(rest)})
