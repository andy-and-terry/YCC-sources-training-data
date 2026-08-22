defmodule QuickSort do
  def sort([]), do: []

  def sort([pivot | rest]) do
    {smaller, larger} = Enum.split_with(rest, &(&1 < pivot))
    sort(smaller) ++ [pivot] ++ sort(larger)
  end
end

IO.inspect(QuickSort.sort([5, 3, 8, 1, 9, 2]))
