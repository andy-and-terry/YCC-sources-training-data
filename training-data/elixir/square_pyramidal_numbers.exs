# n(n+1)(2n+1)/6
defmodule SquarePyramidalNumbers do
  def term(n), do: div(((n * (n + 1)) * ((2 * n) + 1)), 6)
end

for n <- 1..15 do
  IO.puts("#{n} -> #{SquarePyramidalNumbers.term(n)}")
end
