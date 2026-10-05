a = MapSet.new([1, 2, 3, 4, 5])
b = MapSet.new([4, 5, 6, 7])

IO.inspect(MapSet.union(a, b))
IO.inspect(MapSet.intersection(a, b))
IO.inspect(MapSet.difference(a, b))
IO.inspect(MapSet.subset?(MapSet.new([1, 2]), a))
IO.inspect(MapSet.disjoint?(a, MapSet.new([9])))
IO.inspect(MapSet.member?(a, 3))

a = a |> MapSet.put(10) |> MapSet.delete(1)
IO.inspect(MapSet.to_list(a))
IO.inspect(MapSet.size(a))

unique = [3, 1, 3, 2, 1] |> MapSet.new() |> Enum.sort()
IO.inspect(unique)
