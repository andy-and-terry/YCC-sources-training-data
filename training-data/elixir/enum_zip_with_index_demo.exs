words = ["alpha", "beta", "gamma"]

words
|> Enum.with_index(1)
|> Enum.each(fn {w, i} -> IO.puts("#{i}. #{w}") end)

IO.inspect(Enum.zip(words, [1, 2, 3]))
IO.inspect(Enum.zip_with([1, 2, 3], [10, 20, 30], fn a, b -> a + b end))
IO.inspect(Enum.map_every(1..8, 3, &(&1 * 100)))
IO.inspect(Enum.take_every(1..10, 4))
