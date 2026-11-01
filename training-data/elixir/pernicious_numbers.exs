# Pernicious numbers: the popcount is prime.
defmodule Pernicious do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: not Enum.any?(2..n, fn d -> d * d <= n and rem(n, d) == 0 end)

  def popcount(n), do: n |> Integer.digits(2) |> Enum.sum()
end

1..20
|> Enum.filter(fn n -> Pernicious.prime?(Pernicious.popcount(n)) end)
|> Enum.join(" ")
|> IO.puts()
