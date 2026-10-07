a = MapSet.new([1, 2, 3, 4])
b = MapSet.new([3, 4, 5])

IO.inspect(MapSet.union(a, b))
IO.inspect(MapSet.intersection(a, b))
IO.inspect(MapSet.difference(a, b))
IO.inspect(MapSet.member?(a, 2))
IO.inspect(MapSet.subset?(MapSet.new([1, 2]), a))
IO.inspect(MapSet.disjoint?(a, MapSet.new([9])))
IO.inspect(MapSet.size(a))
IO.inspect(MapSet.put(a, 10) |> MapSet.to_list())
IO.inspect(Enum.map(a, &(&1 * 2)))

first_dup =
  Enum.reduce_while([1, 2, 3, 2, 1], MapSet.new(), fn x, seen ->
    if MapSet.member?(seen, x), do: {:halt, x}, else: {:cont, MapSet.put(seen, x)}
  end)

IO.inspect(first_dup)
