defmodule TailRecSum do
  def sum(list), do: sum(list, 0)
  defp sum([], acc), do: acc
  defp sum([h | t], acc), do: sum(t, acc + h)

  def sum_range(a, b), do: sum_range(a, b, 0)
  defp sum_range(a, b, acc) when a > b, do: acc
  defp sum_range(a, b, acc), do: sum_range(a + 1, b, acc + a)
end

IO.inspect(TailRecSum.sum([1, 2, 3, 4, 5]))
IO.inspect(TailRecSum.sum_range(1, 100))
