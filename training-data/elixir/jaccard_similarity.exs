defmodule Jaccard do
  def similarity(a, b) do
    a = MapSet.new(a)
    b = MapSet.new(b)
    union = MapSet.union(a, b) |> MapSet.size()
    if union == 0, do: 1.0, else: MapSet.intersection(a, b) |> MapSet.size() |> Kernel./(union)
  end
end

IO.puts(Jaccard.similarity([1, 2, 3, 4], [3, 4, 5]))
