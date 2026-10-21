# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
padovan =
  Stream.unfold({1, 1, 1}, fn {a, b, c} -> {a, {b, c, a + b}} end)

padovan |> Enum.take(15) |> Enum.join(" ") |> IO.puts()
