defmodule Acc do
  def sum(list), do: sum(list, 0)
  defp sum([], acc), do: acc
  defp sum([h | t], acc), do: sum(t, acc + h)
end

IO.puts(Acc.sum([1, 2, 3, 4]))
