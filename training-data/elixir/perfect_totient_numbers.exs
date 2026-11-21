# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
defmodule PerfectTotient do
  def phi(n), do: Enum.count(1..n, &(Integer.gcd(&1, n) == 1))

  def chain_sum(m, acc) when m <= 1, do: acc
  def chain_sum(m, acc), do: chain_sum(phi(m), acc + phi(m))

  def perfect?(n), do: chain_sum(n, 0) == n
end

2..199 |> Enum.filter(&PerfectTotient.perfect?/1) |> Enum.join(" ") |> IO.puts()
