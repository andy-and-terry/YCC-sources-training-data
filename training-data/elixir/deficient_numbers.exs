# Deficient numbers below 100; expect 76.
defmodule DeficientNumbers do
  defp proper_sum(n), do: Enum.sum(for d <- 1..n, d < n, rem(n, d) == 0, do: d)

  def run do
    IO.puts(Enum.count(1..99, fn n -> proper_sum(n) < n end))
  end
end

DeficientNumbers.run()
