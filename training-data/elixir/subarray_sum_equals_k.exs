# Count contiguous subarrays whose sum equals k (prefix sums + Map).
defmodule Subarray do
  def count(nums, k) do
    {_, _, count} =
      Enum.reduce(nums, {%{0 => 1}, 0, 0}, fn x, {seen, total, count} ->
        total = total + x
        count = count + Map.get(seen, total - k, 0)
        {Map.update(seen, total, 1, &(&1 + 1)), total, count}
      end)

    count
  end
end

IO.puts(Subarray.count([1, 1, 1], 2))
