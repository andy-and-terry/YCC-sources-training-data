powers = Stream.iterate(1, &(&1 * 2))
IO.inspect(Enum.take(powers, 8))

fib = Stream.iterate({0, 1}, fn {a, b} -> {b, a + b} end) |> Stream.map(&elem(&1, 0))
IO.inspect(Enum.take(fib, 10))

IO.inspect(Stream.cycle([:a, :b, :c]) |> Enum.take(7))
IO.inspect(Stream.repeatedly(fn -> 1 end) |> Enum.take(3))

result =
  1..1_000_000
  |> Stream.filter(&(rem(&1, 7) == 0))
  |> Stream.map(&(&1 * &1))
  |> Stream.take_while(&(&1 < 10_000))
  |> Enum.to_list()

IO.inspect(result)
IO.inspect(Stream.concat([1, 2], [3]) |> Enum.to_list())
IO.inspect(Stream.zip(1..3, [:x, :y, :z]) |> Enum.to_list())
IO.inspect(Stream.with_index(~w(a b c)) |> Enum.to_list())
