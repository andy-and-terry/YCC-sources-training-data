numbers = [1, 2, 3, 5, 6, 9, 10, 11]

runs =
  Enum.chunk_while(
    numbers,
    [],
    fn
      x, [] -> {:cont, [x]}
      x, [prev | _] = acc when x == prev + 1 -> {:cont, [x | acc]}
      x, acc -> {:cont, Enum.reverse(acc), [x]}
    end,
    fn
      [] -> {:cont, []}
      acc -> {:cont, Enum.reverse(acc), []}
    end
  )

IO.inspect(runs)

IO.inspect(Enum.chunk_by([1, 1, 2, 3, 3, 3], & &1))
IO.inspect(Enum.chunk_every([1, 2, 3, 4, 5], 2, 2, :discard))
