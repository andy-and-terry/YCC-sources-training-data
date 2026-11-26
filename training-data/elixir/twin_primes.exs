# Twin primes below 100; expect 8.
defmodule TwinPrimes do
  defp prime?(n) when n < 2, do: false
  defp prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)

  def run do
    IO.puts(Enum.count(2..99, fn p -> prime?(p) and prime?(p + 2) end))
  end
end

TwinPrimes.run()
