defmodule QuicksortVariants do
  def sort([]), do: []

  def sort([pivot | rest]) do
    {less, greater} = Enum.split_with(rest, &(&1 < pivot))
    sort(less) ++ [pivot] ++ sort(greater)
  end

  def sort_last([]), do: []

  def sort_last(list) do
    {init, [pivot]} = Enum.split(list, length(list) - 1)
    {less, greater} = Enum.split_with(init, &(&1 < pivot))
    sort_last(less) ++ [pivot] ++ sort_last(greater)
  end
end

IO.inspect(QuicksortVariants.sort([9, 3, 7, 1, 8, 2]))
IO.inspect(QuicksortVariants.sort_last([9, 3, 7, 1, 8, 2]))
