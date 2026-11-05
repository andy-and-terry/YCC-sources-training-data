squares = for n <- 1..6, rem(n, 2) == 0, into: %{}, do: {n, n * n}
IO.inspect(squares)
pairs = for x <- 1..3, y <- ~w(a b), do: {x, y}
IO.inspect(pairs)
