# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
defmodule Lah do
  def fact(n) when n <= 1, do: 1
  def fact(n), do: n * fact(n - 1)
  def comb(n, k), do: div(fact(n), fact(k) * fact(n - k))
end

n = 5
1..n |> Enum.map(fn k -> div(Lah.comb(n - 1, k - 1) * Lah.fact(n), Lah.fact(k)) end) |> Enum.join(" ") |> IO.puts()
