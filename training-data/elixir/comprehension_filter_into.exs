squares = for x <- 1..10, rem(x, 2) == 0, into: %{}, do: {x, x * x}
IO.inspect(squares)
