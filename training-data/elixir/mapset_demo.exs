a = MapSet.new([1, 2, 3, 4])
b = MapSet.new([3, 4, 5, 6])

IO.inspect(MapSet.union(a, b) |> MapSet.to_list())
IO.inspect(MapSet.intersection(a, b))
IO.inspect(MapSet.difference(a, b))
IO.inspect(MapSet.member?(a, 2))
IO.inspect(MapSet.subset?(MapSet.new([1, 2]), a))
IO.inspect(MapSet.disjoint?(a, MapSet.new([9])))
IO.inspect(MapSet.size(MapSet.put(a, 2)))
IO.inspect(MapSet.delete(a, 1))

unique_words =
  "the cat and the hat and the bat"
  |> String.split()
  |> MapSet.new()

IO.inspect(MapSet.size(unique_words))
IO.inspect(Enum.sort(unique_words))
IO.inspect(Enum.map(a, &(&1 * 10)))
