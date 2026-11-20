# Twin primes below 50.
prime? = fn n -> n > 1 and Enum.all?(2..max(2, trunc(:math.sqrt(n))), &(&1 == n or rem(n, &1) != 0)) end
IO.inspect(for p <- 2..50, prime?.(p), prime?.(p + 2), do: {p, p + 2})
