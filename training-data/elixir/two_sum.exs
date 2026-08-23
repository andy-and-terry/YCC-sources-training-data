defmodule TwoSum do
  def find(list, target) do
    list
    |> Enum.with_index()
    |> Enum.reduce_while(%{}, fn {n, i}, seen ->
      complement = target - n

      case Map.fetch(seen, complement) do
        {:ok, j} -> {:halt, {j, i}}
        :error -> {:cont, Map.put(seen, n, i)}
      end
    end)
  end
end

IO.inspect(TwoSum.find([2, 7, 11, 15], 9))
