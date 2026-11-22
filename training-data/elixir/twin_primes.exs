# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
defmodule Twin do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)
end

2..99 |> Enum.filter(fn p -> Twin.prime?(p) and Twin.prime?(p + 2) end) |> Enum.join(" ") |> IO.puts()
