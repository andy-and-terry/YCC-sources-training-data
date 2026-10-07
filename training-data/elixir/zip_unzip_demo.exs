names = ["Ann", "Bob", "Cy"]
ages = [30, 25, 41]

pairs = Enum.zip(names, ages)
IO.inspect(pairs)

{ns, as} = Enum.unzip(pairs)
IO.inspect(ns)
IO.inspect(as)

IO.inspect(Map.new(pairs))
IO.inspect(Enum.zip_with(ages, ages, &(&1 + &2)))
IO.inspect(Enum.zip([[1, 2], [3, 4], [5, 6]]))
IO.inspect(List.zip([[1, 2], [3, 4]]))
IO.inspect(Enum.zip(1..3, Stream.cycle([:a, :b])))
IO.inspect(Enum.zip_reduce([[1, 2], [3, 4]], 0, fn [a, b], acc -> acc + a * b end))
