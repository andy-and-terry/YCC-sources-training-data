defmodule InsertionSort do
  def sort(list), do: Enum.reduce(list, [], &insert/2)

  defp insert(x, []), do: [x]
  defp insert(x, [h | t]) when x < h, do: [x, h | t]
  defp insert(x, [h | t]), do: [h | insert(x, t)]
end

IO.inspect(InsertionSort.sort([12, 11, 13, 5, 6]))
