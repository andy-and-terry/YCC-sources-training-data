words = ~w(apple pear apple fig pear apple)

IO.inspect(Enum.frequencies(words))
IO.inspect(Enum.uniq(words))
IO.inspect(Enum.dedup([1, 1, 2, 2, 2, 3, 1]))
IO.inspect(Enum.frequencies_by(words, &String.length/1))
IO.inspect(Enum.uniq_by([{1, :a}, {2, :a}, {3, :b}], fn {_, k} -> k end))
