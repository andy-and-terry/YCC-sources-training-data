# Sophie Germain primes: p prime and 2p + 1 prime.
defmodule Sophie do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)
end

2..99 |> Enum.filter(fn p -> Sophie.prime?(p) and Sophie.prime?(2 * p + 1) end) |> Enum.join(" ") |> IO.puts()
