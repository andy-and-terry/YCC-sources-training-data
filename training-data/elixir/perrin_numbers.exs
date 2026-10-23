# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
perrin =
  Stream.unfold({3, 0, 2}, fn {a, b, c} -> {a, {b, c, a + b}} end)

IO.puts(perrin |> Enum.take(15) |> Enum.join(" "))
