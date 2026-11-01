result =
  Stream.iterate(1, &(&1 + 1))
  |> Stream.map(&(&1 * &1))
  |> Stream.filter(&(rem(&1, 2) == 1))
  |> Enum.take(5)

IO.inspect(result)
