result =
  1..10
  |> Enum.filter(&(rem(&1, 2) == 0))
  |> Enum.map(&(&1 * &1))
  |> Enum.sum()

IO.puts(result)
