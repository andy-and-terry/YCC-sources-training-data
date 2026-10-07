defmodule Recursion do
  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])

  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  def flatten([]), do: []
  def flatten([h | t]) when is_list(h), do: flatten(h) ++ flatten(t)
  def flatten([h | t]), do: [h | flatten(t)]

  def count_down(0), do: [0]
  def count_down(n) when n > 0, do: [n | count_down(n - 1)]

  def zip_with(f, [a | as], [b | bs]), do: [f.(a, b) | zip_with(f, as, bs)]
  def zip_with(_f, _, _), do: []
end

IO.inspect(Recursion.reverse([1, 2, 3, 4]))
IO.inspect(Recursion.sum([1, 2, 3, 4]))
IO.inspect(Recursion.flatten([1, [2, [3, [4]]], 5]))
IO.inspect(Recursion.count_down(5))
IO.inspect(Recursion.zip_with(&+/2, [1, 2, 3], [10, 20, 30]))
