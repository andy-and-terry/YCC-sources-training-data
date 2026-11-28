defmodule Happy do
  def happy?(n), do: check(n, MapSet.new())

  defp check(1, _), do: true

  defp check(n, seen) do
    if MapSet.member?(seen, n) do
      false
    else
      next = n |> Integer.digits() |> Enum.map(&(&1 * &1)) |> Enum.sum()
      check(next, MapSet.put(seen, n))
    end
  end
end

1..100 |> Stream.filter(&Happy.happy?/1) |> Enum.take(8) |> IO.inspect()
# [1, 7, 10, 13, 19, 23, 28, 31]
