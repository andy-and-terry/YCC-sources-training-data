a = MapSet.new([1, 2, 3, 4])
b = MapSet.new([3, 4, 5])

IO.inspect(MapSet.union(a, b))
IO.inspect(MapSet.intersection(a, b))
IO.inspect(MapSet.difference(a, b))
IO.inspect(MapSet.subset?(MapSet.new([1, 2]), a))
IO.inspect(MapSet.disjoint?(a, MapSet.new([9])))
IO.inspect(MapSet.member?(a, 3))

unique = [3, 1, 3, 2, 1] |> MapSet.new() |> MapSet.to_list()
IO.inspect(unique)

IO.inspect(Enum.map(a, &(&1 * 2)) |> Enum.sum())
