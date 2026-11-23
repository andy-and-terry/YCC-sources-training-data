# n^2(n+1)/2
defmodule PentagonalPyramidalNumbers do
  def term(n), do: div(((n * n) * (n + 1)), 2)
end

for n <- 1..15 do
  IO.puts("#{n} -> #{PentagonalPyramidalNumbers.term(n)}")
end
