# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
1
|> Stream.iterate(fn r -> r * 10 + 1 end)
|> Enum.take(8)
|> Enum.join(" ")
|> IO.puts()
