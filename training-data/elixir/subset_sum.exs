defmodule SubsetSum do
  def possible?(nums, target) do
    dp = MapSet.new([0])
    result = Enum.reduce(nums, dp, fn n, sums ->
      new_sums = Enum.map(MapSet.to_list(sums), &(&1 + n))
      MapSet.union(sums, MapSet.new(new_sums))
    end)

    MapSet.member?(result, target)
  end
end

IO.inspect(SubsetSum.possible?([3, 34, 4, 12, 5, 2], 9))
IO.inspect(SubsetSum.possible?([3, 34, 4, 12, 5, 2], 10))
