# Square of the sum minus sum of squares for 1..10 (expect 2640)
xs = 1..10
sum = Enum.sum(xs)
squares = xs |> Enum.map(&(&1 * &1)) |> Enum.sum()
IO.puts(sum * sum - squares)
