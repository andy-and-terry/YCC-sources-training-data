# Emirps: primes whose digit reversal is a different prime.
defmodule Emirp do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)

  def emirp?(n) do
    r = n |> Integer.to_string() |> String.reverse() |> String.to_integer()
    r != n and prime?(n) and prime?(r)
  end
end

2..199 |> Enum.filter(&Emirp.emirp?/1) |> Enum.join(" ") |> IO.puts()
