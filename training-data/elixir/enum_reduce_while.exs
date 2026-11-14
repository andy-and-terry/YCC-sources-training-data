r = Enum.reduce_while(1..100, 0, fn n, acc ->
  if acc + n > 50, do: {:halt, acc}, else: {:cont, acc + n}
end)

IO.puts(r)
