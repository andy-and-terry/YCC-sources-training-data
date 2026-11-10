is_prime = fn n ->
  n >= 2 and Enum.all?(Stream.take_while(Stream.iterate(2, &(&1 + 1)), &(&1 * &1 <= n)), &(rem(n, &1) != 0))
end

pairs = for p <- 3..78, is_prime.(p), is_prime.(p + 2), do: "(#{p},#{p + 2})"
IO.puts(Enum.join(pairs, " ")) # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
