is_prime = fn n ->
  n >= 2 and Enum.all?(Stream.take_while(Stream.iterate(2, &(&1 + 1)), &(&1 * &1 <= n)), &(rem(n, &1) != 0))
end

found =
  Stream.iterate(2, &(&1 + 1))
  |> Stream.filter(&(is_prime.(&1) and is_prime.(2 * &1 + 1)))
  |> Enum.take(10)

IO.puts(Enum.join(found, " ")) # 2 3 5 11 23 29 41 53 83 89
