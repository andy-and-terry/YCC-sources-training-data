# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
step = fn row -> Enum.scan([0 | Enum.reverse(row)], &(&1 + &2)) end

[1]
|> Stream.iterate(step)
|> Enum.take(10)
|> Enum.map(&List.last/1)
|> Enum.join(" ")
|> IO.puts()
