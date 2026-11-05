result =
  Stream.iterate(1, &(&1 * 2))
  |> Stream.reject(&(rem(&1, 3) == 0))
  |> Stream.map(&(&1 + 1))
  |> Enum.take(6)

IO.inspect(result)
