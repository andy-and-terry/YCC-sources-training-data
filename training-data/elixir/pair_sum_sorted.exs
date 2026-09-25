defmodule PairSum do
  def find(nums, target) do
    t = List.to_tuple(nums)
    go(t, 0, tuple_size(t) - 1, target)
  end

  defp go(_t, i, j, _target) when i >= j, do: nil

  defp go(t, i, j, target) do
    s = elem(t, i) + elem(t, j)

    cond do
      s == target -> {i, j}
      s < target -> go(t, i + 1, j, target)
      true -> go(t, i, j - 1, target)
    end
  end
end

IO.inspect(PairSum.find([1, 3, 4, 6, 8, 11], 10))
IO.inspect(PairSum.find([1, 2, 3], 100))
