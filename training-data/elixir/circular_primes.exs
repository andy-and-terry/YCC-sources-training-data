# Circular primes below 100; expect 13.
defmodule CircularPrimes do
  defp prime?(n) when n < 2, do: false
  defp prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)

  defp circular?(n) do
    s = Integer.to_string(n)
    Enum.all?(0..(String.length(s) - 1), fn i ->
      {a, b} = String.split_at(s, i)
      prime?(String.to_integer(b <> a))
    end)
  end

  def run do
    IO.puts(Enum.count(2..99, &circular?/1))
  end
end

CircularPrimes.run()
