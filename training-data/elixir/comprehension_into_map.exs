squares = for n <- 1..5, rem(n, 2) == 1, into: %{}, do: {n, n * n}
IO.inspect(squares)
pairs = for x <- 1..3, y <- 1..3, x < y, do: {x, y}
IO.inspect(pairs)
