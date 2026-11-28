defmodule Goldbach do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)

  def pairs(n), do: for(p <- 2..div(n, 2), prime?(p), prime?(n - p), do: {p, n - p})
end

IO.inspect(Goldbach.pairs(28))
