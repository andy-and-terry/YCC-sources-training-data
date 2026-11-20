# Manhattan distance.
manhattan = fn a, b -> Enum.zip(a, b) |> Enum.map(fn {x, y} -> abs(x - y) end) |> Enum.sum() end
IO.inspect(manhattan.([1, 2], [4, 6]))
