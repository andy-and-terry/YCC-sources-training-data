defmodule Sieve do
  def primes(limit) do
    Enum.reduce(2..limit, MapSet.new(2..limit), fn n, primes ->
      if MapSet.member?(primes, n) do
        Enum.reduce(Stream.iterate(n * n, &(&1 + n)) |> Enum.take_while(&(&1 <= limit)), primes, fn m, acc ->
          MapSet.delete(acc, m)
        end)
      else
        primes
      end
    end)
    |> Enum.sort()
  end
end

IO.inspect(Sieve.primes(50))
