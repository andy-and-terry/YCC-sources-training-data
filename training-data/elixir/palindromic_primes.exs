defmodule PalPrimes do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), &(&1 == n or rem(n, &1) != 0))

  def palindrome?(n) do
    s = Integer.to_string(n)
    s == String.reverse(s)
  end
end

2..199 |> Enum.filter(&(PalPrimes.palindrome?(&1) and PalPrimes.prime?(&1))) |> IO.inspect()
# [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
