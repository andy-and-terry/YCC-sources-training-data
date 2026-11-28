sigma = fn n -> Enum.filter(1..n, &(rem(n, &1) == 0)) |> Enum.sum() end

1..20
|> Enum.filter(fn n -> sigma.(n) < 2 * n end)
|> IO.inspect()
