# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
terms =
  Stream.unfold({0, 1}, fn {a, b} -> {a, {b, b + 2 * a}} end)
  |> Enum.take(15)

IO.puts(Enum.join(terms, " "))
