defmodule Cuban do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), &(&1 == n or rem(n, &1) != 0))
end

Stream.iterate(1, &(&1 + 1))
|> Stream.map(&(3 * &1 * &1 + 3 * &1 + 1))
|> Stream.filter(&Cuban.prime?/1)
|> Enum.take(8)
|> IO.inspect()
