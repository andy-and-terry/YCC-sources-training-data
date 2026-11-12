defmodule R do
  def sum(list, acc \\ 0)
  def sum([], acc), do: acc
  def sum([h | t], acc), do: sum(t, acc + h)
end
IO.puts(R.sum(Enum.to_list(1..100)))
r = Enum.reduce_while(1..10, 0, fn x, acc -> if acc + x > 20, do: {:halt, acc}, else: {:cont, acc + x} end)
IO.puts(r)
