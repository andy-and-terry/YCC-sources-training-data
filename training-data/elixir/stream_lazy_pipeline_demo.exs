result =
  1..1_000_000
  |> Stream.map(&(&1 * 3))
  |> Stream.filter(&(rem(&1, 2) == 0))
  |> Stream.take(5)
  |> Enum.to_list()

IO.inspect(result)

fib = Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
IO.inspect(Enum.take(fib, 10))
