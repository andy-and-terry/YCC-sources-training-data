defmodule Emirp do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), &(&1 == n or rem(n, &1) != 0))

  def rev(n), do: n |> Integer.digits() |> Enum.reverse() |> Integer.undigits()
end

2..99
|> Enum.filter(&(Emirp.prime?(&1) and Emirp.rev(&1) != &1 and Emirp.prime?(Emirp.rev(&1))))
|> IO.inspect()
