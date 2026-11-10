is_prime = fn n ->
  n >= 2 and Enum.all?(Stream.take_while(Stream.iterate(2, &(&1 + 1)), &(&1 * &1 <= n)), &(rem(n, &1) != 0))
end

out =
  Stream.iterate(2, &(&1 + 1))
  |> Stream.filter(fn n ->
    r = n |> Integer.to_string() |> String.reverse() |> String.to_integer()
    r != n and is_prime.(n) and is_prime.(r)
  end)
  |> Enum.take(10)

IO.puts(Enum.join(out, " ")) # 13 17 31 37 71 73 79 97 107 113
