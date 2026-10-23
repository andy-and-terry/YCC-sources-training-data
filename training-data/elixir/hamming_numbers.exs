# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
strip = fn strip, n, p ->
  if rem(n, p) == 0, do: strip.(strip, div(n, p), p), else: n
end

is_hamming = fn n ->
  [2, 3, 5] |> Enum.reduce(n, fn p, acc -> strip.(strip, acc, p) end) == 1
end

Stream.iterate(1, &(&1 + 1))
|> Stream.filter(is_hamming)
|> Enum.take(20)
|> Enum.join(" ")
|> IO.puts()
