defmodule CombinationSum do
  def find(candidates, target) do
    backtrack(candidates, target, [])
  end

  defp backtrack(_candidates, target, current) when target == 0, do: [Enum.reverse(current)]
  defp backtrack(_candidates, target, _current) when target < 0, do: []

  defp backtrack(candidates, target, current) do
    candidates
    |> Enum.with_index()
    |> Enum.flat_map(fn {value, index} ->
      remaining = Enum.drop(candidates, index)
      backtrack(remaining, target - value, [value | current])
    end)
  end
end

IO.inspect(CombinationSum.find([2, 3, 6, 7], 7))
