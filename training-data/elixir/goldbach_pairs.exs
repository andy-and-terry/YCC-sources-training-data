# Goldbach partitions of 100; expect 6.
defmodule GoldbachPairs do
  defp prime?(n) when n < 2, do: false
  defp prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)

  def run do
    pairs = for p <- 2..50, prime?(p), prime?(100 - p), do: {p, 100 - p}
    IO.inspect({length(pairs), pairs})
  end
end

GoldbachPairs.run()
