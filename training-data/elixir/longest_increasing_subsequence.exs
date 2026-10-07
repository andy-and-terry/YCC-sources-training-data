defmodule LongestIncreasingSubsequence do
  # Patience-sorting approach: `tails` keeps the smallest possible tail
  # value for an increasing subsequence of each length seen so far.
  def length_of_lis([]), do: 0

  def length_of_lis(nums) do
    tails =
      Enum.reduce(nums, [], fn n, tails ->
        case Enum.find_index(tails, &(&1 >= n)) do
          nil -> tails ++ [n]
          index -> List.replace_at(tails, index, n)
        end
      end)

    length(tails)
  end
end

IO.inspect(LongestIncreasingSubsequence.length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]))
IO.inspect(LongestIncreasingSubsequence.length_of_lis([0, 1, 0, 3, 2, 3]))
IO.inspect(LongestIncreasingSubsequence.length_of_lis([]))
