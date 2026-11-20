# Goldbach pair.
defmodule Goldbach do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), &(&1 == n or rem(n, &1) != 0))
  def pair(n), do: Enum.find_value(2..div(n, 2), fn p -> if prime?(p) and prime?(n - p), do: {p, n - p} end)
end

IO.inspect(Goldbach.pair(28))
