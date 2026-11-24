# Centered square numbers: n^2 + (n+1)^2.
0..9 |> Enum.map(fn n -> n * n + (n + 1) * (n + 1) end) |> Enum.join(" ") |> IO.puts()
