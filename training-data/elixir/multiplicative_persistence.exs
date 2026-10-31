defmodule Persistence do
  def steps(n) when n < 10, do: 0
  def steps(n), do: 1 + steps(n |> Integer.digits() |> Enum.product())
end

for n <- [39, 77, 999, 10], do: IO.puts("#{n} #{Persistence.steps(n)}")
