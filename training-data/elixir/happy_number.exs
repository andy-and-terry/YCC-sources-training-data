defmodule Happy do
  def happy?(n), do: loop(n, MapSet.new())

  defp loop(1, _seen), do: true

  defp loop(n, seen) do
    if MapSet.member?(seen, n) do
      false
    else
      next = n |> Integer.digits() |> Enum.map(&(&1 * &1)) |> Enum.sum()
      loop(next, MapSet.put(seen, n))
    end
  end
end

IO.inspect(Enum.filter(1..50, &Happy.happy?/1))
