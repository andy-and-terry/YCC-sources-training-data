defmodule Emirp do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), &(&1 == n or rem(n, &1) != 0))

  def reverse(n), do: n |> Integer.digits() |> Enum.reverse() |> Integer.undigits()
end

2..199
|> Enum.filter(&(Emirp.reverse(&1) != &1 and Emirp.prime?(&1) and Emirp.prime?(Emirp.reverse(&1))))
|> IO.inspect(limit: :infinity)
# [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
