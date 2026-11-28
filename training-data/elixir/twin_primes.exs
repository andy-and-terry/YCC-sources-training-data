is_prime = fn n -> n > 1 and Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end) end

primes = Enum.filter(2..50, is_prime)

primes
|> Enum.chunk_every(2, 1, :discard)
|> Enum.filter(fn [a, b] -> b - a == 2 end)
|> IO.inspect()
