# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
tribonacci =
  Stream.unfold({0, 0, 1}, fn {a, b, c} -> {a, {b, c, a + b + c}} end)

IO.puts("Tribonacci: " <> Enum.join(Enum.take(tribonacci, 15), ", "))
