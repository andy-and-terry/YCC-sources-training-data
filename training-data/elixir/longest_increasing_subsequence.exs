defmodule LIS do
  def length_of(nums) do
    nums
    |> Enum.reduce([], fn num, tails -> insert(tails, num) end)
    |> length()
  end

  defp insert(tails, num) do
    case find_index(tails, num, 0) do
      nil -> tails ++ [num]
      idx -> List.replace_at(tails, idx, num)
    end
  end

  defp find_index([], _num, _idx), do: nil

  defp find_index([head | rest], num, idx) do
    if head >= num do
      idx
    else
      find_index(rest, num, idx + 1)
    end
  end
end

IO.inspect(LIS.length_of([10, 9, 2, 5, 3, 7, 101, 18]))
IO.inspect(LIS.length_of([0, 1, 0, 3, 2, 3]))
