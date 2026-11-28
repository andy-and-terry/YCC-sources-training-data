defmodule Lah do
  def fact(n), do: Enum.reduce(1..max(n, 1), 1, &*/2)
  def comb(n, k), do: div(fact(n), fact(k) * fact(n - k))
  def lah(n, k), do: div(comb(n - 1, k - 1) * fact(n), fact(k))
end

for n <- 1..5 do
  1..n |> Enum.map(&Lah.lah(n, &1)) |> Enum.join(" ") |> IO.puts()
end
