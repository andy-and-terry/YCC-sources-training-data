# Aliquot sequence: replace n by the sum of its proper divisors.
aliquot_sum = fn n -> Enum.sum(for d <- 1..div(n, 2)//1, rem(n, d) == 0, do: d) end

12
|> Stream.iterate(aliquot_sum)
|> Enum.take(20)
|> Enum.reduce_while([], fn n, acc ->
  if n <= 1, do: {:halt, [n | acc]}, else: {:cont, [n | acc]}
end)
|> Enum.reverse()
|> Enum.join(" ")
|> IO.puts()
