# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
0..9
|> Enum.map(fn n -> div(n * (n + 1), 2) + 1 end)
|> Enum.join(" ")
|> IO.puts()
