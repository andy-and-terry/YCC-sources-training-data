defmodule Math.Impl do
  def add(a, b), do: a + b
  def square(a), do: a * a
end

defmodule Math do
  defdelegate add(a, b), to: Math.Impl
  defdelegate square(a), to: Math.Impl
  defdelegate sum(list), to: Enum
  defdelegate plus(a, b), to: Math.Impl, as: :add
end

IO.puts(Math.add(2, 3))
IO.puts(Math.square(7))
IO.puts(Math.sum([1, 2, 3]))
IO.puts(Math.plus(10, 5))
