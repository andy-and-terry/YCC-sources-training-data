# Hexagonal numbers: n(2n-1).
1..10 |> Enum.map(fn n -> n * (2 * n - 1) end) |> Enum.join(" ") |> IO.puts()
