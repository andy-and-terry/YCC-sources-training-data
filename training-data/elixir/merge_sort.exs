defmodule MergeSort do
  def sort([]), do: []
  def sort([x]), do: [x]

  def sort(list) do
    {left, right} = Enum.split(list, div(length(list), 2))
    merge(sort(left), sort(right))
  end

  defp merge([], right), do: right
  defp merge(left, []), do: left
  defp merge([l | ls], [r | rs]) when l <= r, do: [l | merge(ls, [r | rs])]
  defp merge(left, [r | rs]), do: [r | merge(left, rs)]
end

IO.inspect(MergeSort.sort([5, 2, 9, 1, 5, 6]))
