defmodule LongestIncreasingSubsequence do
  def length_of(nums) do
    Enum.reduce(nums, [], &insert_tail/2)
    |> length()
  end

  defp insert_tail(num, tails) do
    case Enum.find_index(tails, fn t -> t >= num end) do
      nil -> tails ++ [num]
      idx -> List.replace_at(tails, idx, num)
    end
  end
end

IO.inspect(LongestIncreasingSubsequence.length_of([10, 9, 2, 5, 3, 7, 101, 18]))
IO.inspect(LongestIncreasingSubsequence.length_of([0, 1, 0, 3, 2, 3]))
IO.inspect(LongestIncreasingSubsequence.length_of([7, 7, 7, 7]))
