# Pentagonal numbers: n(3n-1)/2.
1..10 |> Enum.map(fn n -> div(n * (3 * n - 1), 2) end) |> Enum.join(" ") |> IO.puts()
