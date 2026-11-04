defmodule MinStack do
  defstruct items: []

  def push(%__MODULE__{items: []} = s, x), do: %{s | items: [{x, x}]}
  def push(%__MODULE__{items: [{_, m} | _] = items} = s, x), do: %{s | items: [{x, min(x, m)} | items]}

  def pop(%__MODULE__{items: [_ | rest]} = s), do: %{s | items: rest}

  def min_value(%__MODULE__{items: [{_, m} | _]}), do: m
end

s = Enum.reduce([5, 3, 7, 2], %MinStack{}, &MinStack.push(&2, &1))
IO.puts(MinStack.min_value(s))
IO.puts(s |> MinStack.pop() |> MinStack.min_value())
