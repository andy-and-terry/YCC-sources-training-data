defmodule SubsetSum do
  def has_subset?(nums, target) do
    Enum.reduce(nums, MapSet.new([0]), fn num, sums ->
      new_sums =
        sums
        |> Enum.map(&(&1 + num))
        |> Enum.filter(&(&1 <= target))
        |> MapSet.new()

      MapSet.union(sums, new_sums)
    end)
    |> MapSet.member?(target)
  end
end

nums = [3, 34, 4, 12, 5, 2]
IO.inspect(SubsetSum.has_subset?(nums, 9))
IO.inspect(SubsetSum.has_subset?(nums, 10))
IO.inspect(SubsetSum.has_subset?(nums, 21))
