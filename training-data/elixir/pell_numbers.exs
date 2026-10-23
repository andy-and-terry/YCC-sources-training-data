# Stream the Pell numbers: P(n) = 2*P(n-1) + P(n-2)
pell = Stream.unfold({0, 1}, fn {a, b} -> {a, {b, 2 * b + a}} end)

pell
|> Enum.take(15)
|> Enum.with_index()
|> Enum.each(fn {p, i} -> IO.puts("P(#{i}) = #{p}") end)
