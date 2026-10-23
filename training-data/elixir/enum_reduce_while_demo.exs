first_over =
  Enum.reduce_while(1..100, 0, fn n, acc ->
    if acc + n > 20, do: {:halt, n}, else: {:cont, acc + n}
  end)

IO.inspect(first_over)

result =
  Enum.reduce_while([1, 2, :bad, 4], {:ok, 0}, fn
    x, {:ok, sum} when is_integer(x) -> {:cont, {:ok, sum + x}}
    x, _ -> {:halt, {:error, x}}
  end)

IO.inspect(result)
