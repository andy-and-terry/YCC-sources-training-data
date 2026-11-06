# Emirps: primes whose digit reversal is a different prime.
defmodule Emirp do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn i -> i == n or rem(n, i) != 0 end)

  def reverse(n), do: n |> Integer.to_string() |> String.reverse() |> String.to_integer()
end

emirps = for n <- 2..99, r = Emirp.reverse(n), r != n, Emirp.prime?(n), Emirp.prime?(r), do: n
IO.inspect(emirps)
