# Bead (gravity) sort.
defmodule BeadSort do
  def sort(nums) do
    cols = for i <- 1..Enum.max(nums), do: Enum.count(nums, &(&1 >= i))
    for(r <- 1..length(nums), do: Enum.count(cols, &(&1 >= r))) |> Enum.reverse()
  end
end

IO.inspect(BeadSort.sort([5, 3, 1, 4, 2]))
