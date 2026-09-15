defmodule CountingSort do
  def sort([]), do: []

  def sort(list) do
    max = Enum.max(list)

    counts =
      Enum.reduce(list, %{}, fn v, acc -> Map.update(acc, v, 1, &(&1 + 1)) end)

    0..max
    |> Enum.flat_map(fn v -> List.duplicate(v, Map.get(counts, v, 0)) end)
  end
end

IO.inspect(CountingSort.sort([4, 2, 2, 8, 3, 3, 1]))
