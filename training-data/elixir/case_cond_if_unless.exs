x = 15

cond do
  x < 10 -> IO.puts("small")
  x < 20 -> IO.puts("medium")
  true -> IO.puts("large")
end

case {x, rem(x, 5)} do
  {n, 0} when n > 10 -> IO.puts("big multiple of 5")
  {_, 0} -> IO.puts("multiple of 5")
  _ -> IO.puts("other")
end

IO.puts(if x > 10, do: "gt", else: "le")
unless x == 0, do: IO.puts("nonzero")
IO.inspect(for n <- 1..10, rem(n, 2) == 0, into: %{}, do: {n, n * n})
IO.inspect(for {k, v} <- [a: 1, b: 2], v > 1, do: k)
IO.inspect(for x <- 1..3, y <- 1..3, x < y, do: {x, y})
