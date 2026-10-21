# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
cows = Stream.unfold({1, 1, 1}, fn {a, b, c} -> {a, {b, c, a + c}} end)

IO.puts(cows |> Enum.take(15) |> Enum.join(" "))
